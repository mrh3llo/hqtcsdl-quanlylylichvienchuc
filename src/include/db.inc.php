<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$host = "mysql";
$dbname = "CSDL_VIEN_CHUC";

$user = isset($_COOKIE['db_user']) ? $_COOKIE['db_user'] : '';
$pass = isset($_COOKIE['db_pass']) ? $_COOKIE['db_pass'] : '';

if (empty($user)) {
    die("Haven't log-in yet.");
}

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        $user,
        $pass
    );

    // Set error mode to exceptions for better debugging
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Connected successfully";
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>