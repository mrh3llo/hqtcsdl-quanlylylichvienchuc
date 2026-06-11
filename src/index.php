<?php
$requestPath = parse_url($_SERVER['REQUEST_URI'] ?? '/', PHP_URL_PATH) ?: '/';
$request = rtrim($requestPath, '/');

if ($request === '') {
    $request = '/';
}

$routes = [
    '/'          => 'pages/home.php',
    '/home'      => 'pages/home.php',
    '/login'     => 'pages/login.php',
    '/dashboard' => 'pages/dashboard.php',
];

if (array_key_exists($request, $routes)) {
    if ($request !== '/login') {
        include_once 'include/db.inc.php';
    }

    include_once $routes[$request];
} else {
    http_response_code(404);
    include_once 'pages/404.php';
}