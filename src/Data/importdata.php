<?php
$host = 'mysql'; 
$port = '3306';     
$user = 'root';     
$pass = '1234567';  
$dbname = 'CSDL_VIEN_CHUC';

$csvFolder = __DIR__ . "/csv";

try {
    $dsn = "mysql:host=$host;port=$port;dbname=$dbname";
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
    echo "Connected successfully!";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}


$tables = [
    "BACLUONG",
    "CAPLYLUANCHINHTRI",
    "CAPQUANLYNHANUOC",
    "CHITIETLUONG",
    "CHUCDANH_NGHENGHIEP",
    "CHUCVU",
    "CHUNGCHITINHOC",
    "CHUYENMON",
    "COQUAN",
    "DANHHIEU",
    "DANTOC",
    "HANGTHUONGBINH",
    "HINHTHUCKHENTHUONG",
    "HINHTHUCKYLUAT",
    "HOCHAM",
    "NGOAINGU",
    "NHOMNGACH",
    "QUANHAM",
    "THONGTINQUANDOI",
    "TINHTHANH",
    "TINHTRANGSUCKHOE",
    "TOCHUCDOANTHECHINHTRIXAHOI",
    "TONGIAO",
    "TRINHDOHOCVAN"
];


function importCSV(PDO $pdo, string $tableName, string $csvPath)
{
    if (!file_exists($csvPath)) {
        echo "CSV no foundie: $csvPath\n";
        return;
    }

    echo "doing $tableName...\n";

    $handle = fopen($csvPath, "r");

    if ($handle === false) {
        echo "Lmao: $csvPath\n";
        return;
    }

    $headers = fgetcsv($handle);

    if (!$headers) {
        echo "CSV is fucking empty $csvPath\n";
        fclose($handle);
        return;
    }

    $headers[0] = preg_replace('/^\xEF\xBB\xBF/', '', $headers[0]);

    // Build SQL
    $columns = implode(", ", $headers);

    $placeholders = implode(", ", array_map(function($h) {
        return ":" . $h;
    }, $headers));

    $sql = "INSERT INTO $tableName ($columns)
            VALUES ($placeholders)";

    $stmt = $pdo->prepare($sql);

    $rowCount = 0;

    while (($row = fgetcsv($handle)) !== false) {

        // skip empty rows
        if (count(array_filter($row)) == 0) {
            continue;
        }

        $data = [];

        foreach ($headers as $index => $column) {

            $value = $row[$index] ?? null;

            if ($value === '') {
                $value = null;
            }

            $data[$column] = $value;
        }

        try {
            $stmt->execute($data);
            $rowCount++;

        } catch (PDOException $e) {

            echo "insert error in $tableName:\n";
            echo $e->getMessage() . "\n";

            echo "Data:\n";
            print_r($data);
        }
    }

    fclose($handle);

    echo "imported $rowCount rows into $tableName\n\n";
}


foreach ($tables as $table) {
    $csvPath = $csvFolder . "/" . $table . ".csv";
    importCSV($pdo, $table, $csvPath);
}

echo "DONE\n";
?>