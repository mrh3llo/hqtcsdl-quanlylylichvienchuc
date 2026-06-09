<?php
ob_implicit_flush(true);
while (ob_get_level()) ob_end_clean();

$host = 'mysql'; 
$port = '3306'; 
$user = 'root'; 
$pass = '1234567'; 
$dbname = 'CSDL_VIEN_CHUC';

$basePath = "/var/www/html/Data/csv"; 

echo "Starting import process...\n";
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

$maxAttempts = 20; 
$attempt = 0;
$pdo = null;

echo "Connecting to database at host: '$host' on port: '$port'...\n";

while ($attempt < $maxAttempts) {
    try {
        $attempt++;
        $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname;charset=utf8mb4", $user, $pass, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_TIMEOUT => 2 
        ]);
    
        echo "Connected successfully on attempt #$attempt!\n";
        break; 
        
    } catch (Throwable $e) {
        echo "Attempt #$attempt failed (MySQL might still be initializing...). Retrying in 3 seconds...\n";
        
        if ($attempt >= $maxAttempts) {
            die("CRITICAL CONNECTION ERROR: Failed to connect after $maxAttempts attempts. " . $e->getMessage() . "\n");
        }
        
        sleep(3);
    }
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
    
    $isVienChuc = (strtoupper($tableName) === 'VIENCHUC');
    $stmt = null;

    if ($isVienChuc) {
        // ? heheh ?????????????????????????????
        $sql = "CALL SP_THEM_VIENCHUC(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $pdo->prepare($sql);
    } else {
        $sql = "INSERT INTO $tableName (" . implode(", ", $headers) . ") VALUES (" . 
               implode(", ", array_map(fn($h) => ":$h", $headers)) . ")";
        $stmt = $pdo->prepare($sql);
    }
    
    $rowCount = 0;

    while (($row = fgetcsv($handle)) !== false) {
        if (count(array_filter($row)) == 0) continue;
        
        if ($isVienChuc) {
            $csvData = [];
            foreach ($headers as $index => $column) {
                $csvData[strtoupper($column)] = ($row[$index] === '') ? null : $row[$index];
            }

            // ! FUCK YOU QUOC WHY MUST YOU FUCKING PUT EVERYTHING INTO VIENCHUC TABLE!!!!!!!!
            $spParameters = [
                $csvData['MAVIENCHUC'] ?? null, $csvData['MADANHHIEU'] ?? null, $csvData['MATONGIAO'] ?? null,
                $csvData['MAHOCHAM'] ?? null, $csvData['MATRINHDO'] ?? null, $csvData['MADANTOC'] ?? null,
                $csvData['MAHANGTHUONGBINH'] ?? null, $csvData['MAXAPHUONG'] ?? null, $csvData['XAP_MAXAPHUONG'] ?? null,
                $csvData['HO'] ?? null, $csvData['TENLOT'] ?? null, $csvData['TEN'] ?? null, $csvData['TENKHAC'] ?? null,
                $csvData['NGAYSINH'] ?? null, $csvData['GIOITINH'] ?? null, $csvData['NGAYTUYENDUNG'] ?? null,
                $csvData['SOHIEUVIENCHUC'] ?? null, $csvData['ANHDAIDIEN'] ?? null, $csvData['SOCCCD'] ?? null,
                $csvData['NOICAPCCCD'] ?? null, $csvData['NGAYCAPCCCD'] ?? null, $csvData['SOBAOHIEM'] ?? null,
                $csvData['NHOMMAU'] ?? null, $csvData['NAMDUOCPHONGHOCHAM'] ?? null, $csvData['NAMDUOCPHONGDANHHIEU'] ?? null,
                // ! idk wtf am i doing
                $csvData['ROLE'] ?? 'vienchuc' 
            ];

            try {
                $stmt->execute($spParameters);
                $rowCount++;
            } catch (PDOException $e) {
                echo "Error in Stored Procedure execution for $tableName (ID: " . ($csvData['MAVIENCHUC'] ?? 'Unknown') . "): " . $e->getMessage() . "\n";
            }

        } else {
            // * EVERYTHING EXCEPT VIENCHUC
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
    }
    fclose($handle);
    echo "Done $tableName ($rowCount rows).\n\n";
}

foreach ($importSequence as $folder => $tables) {
    echo "--- Processing folder: $folder ---\n";
    foreach ($tables as $table) {
        $path = $basePath . "/" . $folder . "/" . $table . ".csv";
        importCSV($pdo, $table, $path);
    }
}

echo "ALL IMPORT OPERATIONS COMPLETED.\n";
$pdo = null;
?>