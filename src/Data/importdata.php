<?php
$host = 'mysql'; 
$port = '3306'; 
$user = 'root'; 
$pass = '1234567'; 
$dbname = 'CSDL_VIEN_CHUC';

$basePath = "/var/www/html/Data/csv"; 

echo "Starting import process...\n";
// Cấu trúc danh sách các nhóm bảng theo thứ tự nhập
$importSequence = [
    "01_DanhMuc" => [
        "BACLUONG", "CAPLYLUANCHINHTRI", "CAPQUANLYNHANUOC", "CHITIETLUONG", 
        "CHUCDANH_NGHENGHIEP", "CHUCVU", "CHUNGCHITINHOC", "CHUYENMON", 
        "COQUAN", "DANHHIEU", "DANTOC", "HANGTHUONGBINH", "HINHTHUCKHENTHUONG", 
        "HINHTHUCKYLUAT", "HOCHAM", "NGOAINGU", "NHOMNGACH", "QUANHAM", 
        "THONGTINQUANDOI", "TINHTHANH", "TINHTRANGSUCKHOE", "TOCHUCDOANTHECHINHTRIXAHOI", 
        "TONGIAO", "TRINHDOHOCVAN"
    ],
    "02_VienChuc" => [
        "XAPHUONG", "VIENCHUC"
    ],
    "03_QuanHe" => [
        "CO_CAPLYLUANCHINHTRI", "CO_CAPQUANLYNHANUOC", "CO_CHUCVU", "CO_HESOLUONG", 
        "CO_HOKHAUTHUONGTRU", "CO_TAMTRU", "CO_TINHTRANGSK", "CO_TRDCM_CAONHAT", 
        "CO_TRD_NGOAINGU", "CO_TRD_TINHOC", "DUOC_KHENTHUONG", "THUOC_NHOM_NGACH", 
        "THUOC_QUANDOI", "THUOC_TOCHUCDOANTHECHINHTRIXAHOI", "TUYENDUNG", "BI_KYLUAT"
    ]
];

try {
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
    echo "Connected successfully!\n";
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

function importCSV(PDO $pdo, string $tableName, string $csvPath) {
    if (!file_exists($csvPath)) {
        echo "CSV not found: $csvPath\n";
        return;
    }

    echo "Importing: $tableName...\n";
    $handle = fopen($csvPath, "r");
    $headers = fgetcsv($handle);
    if (!$headers) { fclose($handle); return; }
    
    $headers[0] = preg_replace('/^\xEF\xBB\xBF/', '', $headers[0]);
    $sql = "INSERT INTO $tableName (" . implode(", ", $headers) . ") VALUES (" . 
           implode(", ", array_map(fn($h) => ":$h", $headers)) . ")";
    
    $stmt = $pdo->prepare($sql);
    $rowCount = 0;

    while (($row = fgetcsv($handle)) !== false) {
        if (count(array_filter($row)) == 0) continue;
        
        $data = [];
        foreach ($headers as $index => $column) {
            $data[$column] = ($row[$index] === '') ? null : $row[$index];
        }

        try {
            $stmt->execute($data);
            $rowCount++;
        } catch (PDOException $e) {
            echo "Error in $tableName: " . $e->getMessage() . "\n";
        }
    }
    fclose($handle);
    echo "Done $tableName ($rowCount rows).\n\n";
}

// Chạy vòng lặp theo cấu trúc $importSequence
foreach ($importSequence as $folder => $tables) {
    echo "--- Processing folder: $folder ---\n";
    foreach ($tables as $table) {
        $path = $basePath . "/" . $folder . "/" . $table . ".csv";
        importCSV($pdo, $table, $path);
    }
}

echo "ALL IMPORT OPERATIONS COMPLETED.\n";

echo "All paths in directory $basePath:\n";
function listAllFiles($dir) {
    $files = [];
    foreach (scandir($dir) as $item) {
        if ($item === '.' || $item === '..') continue;
        $path = $dir . '/' . $item;
        if (is_dir($path)) {
            $files = array_merge($files, listAllFiles($path));
        } else {
            $files[] = $path;
        }
    }
    return $files;
}
$pdo = null;
?>