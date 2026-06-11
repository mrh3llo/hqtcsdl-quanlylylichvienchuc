<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$host = "mysql";
$dbname = "CSDL_VIEN_CHUC";

$message = ""; 

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $input_user = isset($_POST['username']) ? trim($_POST['username']) : '';
    $input_pass = isset($_POST['password']) ? trim($_POST['password']) : '';

    if (empty($input_user) || empty($input_pass)) {
        $message = "Please fill in both fields.";
    } else {
        try {
            $pdo = new PDO(
                "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
                $input_user,
                $input_pass
            );
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            setcookie("db_user", $input_user, time() + 3600, "/");
            setcookie("db_pass", $input_pass, time() + 3600, "/");

            header("Location: /home");
            exit;
            
        } catch (PDOException $e) {
            // Connection failed (wrong username or password)
            $message = "Login failed: Invalid database credentials.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Database Login</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; padding: 50px; }
        .login-container { max-width: 350px; margin: 0 auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group input { width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        .btn { width: 100%; padding: 10px; background-color: #007BFF; color: white; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background-color: #0056b3; }
        .message { margin-bottom: 15px; padding: 10px; border-radius: 4px; background-color: #e2e3e5; text-align: center; }
    </style>
</head>
<body>

<div class="login-container">
    <h2>DB Login</h2>
    
    <?php if (!empty($message)): ?>
        <div class="message"><?php echo htmlspecialchars($message); ?></div>
    <?php endif; ?>

    <form action="/login" method="POST">
        <div class="form-group">
            <label for="username">Database Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Database Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="btn">Login & Save to Cookie</button>
    </form>
</div>

</body>
</html>