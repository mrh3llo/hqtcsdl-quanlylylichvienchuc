<?php
http_response_code(404);

$pageTitle = "404 - Page Not Found";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $pageTitle; ?></title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            text-align: center;
            padding: 50px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
        }
        h1 {
            font-size: 6rem;
            margin: 0;
            color: #dc3545;
        }
        h2 {
            font-size: 2rem;
            margin-top: 0;
        }
        p {
            font-size: 1.1rem;
            color: #6c757d;
            line-height: 1.6;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 24px;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>404</h1>
        <h2>Oops! Page Not Found</h2>
        <p>The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</p>
        <a href="/" class="btn">Return to Homepage</a>
    </div>
</body>
</html>
<?php 
// 3. Stop script execution immediately 
exit(); 
?>
