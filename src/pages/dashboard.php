<?php
// 1. Khởi động Session ngay đầu file (Tránh lỗi Headers Already Sent)
if (session_status() === PHP_SESSION_NONE) { 
    session_start(); 
}

// Đọc thông báo từ trang xử lý form (nếu có) và xóa ngay để tránh lặp lại khi F5
$actionMsg = $_SESSION['action_msg'] ?? '';
$actionStatus = $_SESSION['action_status'] ?? false;
unset($_SESSION['action_msg'], $_SESSION['action_status']);

// 2. Nhập file kết nối cơ sở dữ liệu
require_once __DIR__ . '/../include/db.inc.php';

// 3. Khởi tạo section với giá trị mặc định
$section = isset($_GET['section']) && $_GET['section'] !== '' ? (string)$_GET['section'] : 'thong-tin-ca-nhan';

function h(?string $s): string {
    return htmlspecialchars($s ?? '', ENT_QUOTES, 'UTF-8');
}

function render_table(array $rows, string $emptyMessage): string
{
    if (empty($rows)) {
        return '<div class="empty-msg">' . htmlspecialchars($emptyMessage, ENT_QUOTES, 'UTF-8') . '</div>';
    }

    $headers = array_keys($rows[0]);
    ob_start();
    ?>
    <div class="table-wrap">
        <table>
            <thead>
                <tr>
                    <?php foreach ($headers as $header): ?>
                        <th><?php echo h((string)$header); ?></th>
                    <?php endforeach; ?>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($rows as $row): ?>
                    <tr>
                        <?php foreach ($headers as $header): ?>
                            <td><?php echo h(isset($row[$header]) ? (string)$row[$header] : ''); ?></td>
                        <?php endforeach; ?>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <?php
    return (string)ob_get_clean();
}

function call_sp(PDO $pdo, string $spName): array {
    $stmt = $pdo->query("CALL $spName()");
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    $stmt->closeCursor();
    return $rows;
}

function call_sp_with_params(PDO $pdo, string $spName, array $params): array {
    $placeholders = implode(',', array_fill(0, count($params), '?'));
    $sql = "CALL {$spName}({$placeholders})";

    $stmt = $pdo->prepare($sql);
    $stmt->execute(array_values($params));

    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    $stmt->closeCursor();

    return $rows;
}

// Lấy và format lại role từ MySQL
$roleRow = $pdo->query("SELECT current_role() AS current_role")->fetch(PDO::FETCH_ASSOC);
$rawRole = $roleRow['current_role'] ?? '';
$currentRole = str_replace('`', '', explode('@', $rawRole)[0]);

$loadError = '';
$resultRows = [];

$spList = [];
$spParams = [];
$selectedSp = '';

$viewList = [];
$selectedDbView = '';

// Hệ thống cấu trúc định tuyến (Routes)
$routes = [
    'thong-tin-ca-nhan' => [
        'canhan-thongtin' => function() use ($pdo) { return call_sp($pdo, 'SP_CANHAN_THONGTIN'); },
    ],
    'hr-procedure' => [
        'them-vien-chuc' => function() use ($currentRole, &$loadError) {
            if (!in_array($currentRole, ['hr_role', 'admin_role'], true)) {
                $loadError = 'Bạn không có quyền truy cập chức năng này.';
            }
            return [];
        },
        'vienchuc-dashboard' => function() use ($pdo) { return call_sp($pdo, 'SP_VIENCHUC_DASHBOARD'); },
        'vienchuc-lichsu-congtac' => function() use ($pdo) {
            $stmt = $pdo->query("CALL SP_VIENCHUC_LICHSU_CONGTAC()");
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
            $stmt->closeCursor();
            return $rows;
        },
        'vienchuc-khenthuong' => function() use ($pdo) { return call_sp($pdo, 'SP_VIENCHUC_KHENTHUONG'); },
        'vienchuc-kyluat' => function() use ($pdo) { return call_sp($pdo, 'SP_VIENCHUC_KYLUAT'); },
        'vienchuc-bang' => function() use ($pdo) { return call_sp($pdo, 'SP_VIENCHUC_BANG'); },
        'hr-sp' => function() use ($pdo, $currentRole, &$loadError, &$resultRows, &$spList, &$spParams, &$selectedSp) {
            if (!in_array($currentRole, ['hr_role', 'admin_role'], true)) {
                $loadError = 'Bạn không có quyền sử dụng HR SP.';
                return [];
            }

            $dbName = $pdo->query('SELECT DATABASE()')->fetchColumn();

            $stmt = $pdo->prepare("
                SELECT ROUTINE_NAME 
                FROM INFORMATION_SCHEMA.ROUTINES 
                WHERE ROUTINE_TYPE = 'PROCEDURE' 
                AND ROUTINE_SCHEMA = ? 
                AND ROUTINE_NAME LIKE 'SP_%'
                ORDER BY ROUTINE_NAME
            ");
            $stmt->execute([$dbName]);
            $spList = $stmt->fetchAll(PDO::FETCH_COLUMN) ?: [];

            $selectedSp = $_GET['sp_name'] ?? $_POST['sp_name'] ?? '';
            if ($selectedSp && !in_array($selectedSp, $spList, true)) {
                $selectedSp = '';
            }

            if ($selectedSp) {
                $stmt = $pdo->prepare("
                    SELECT PARAMETER_NAME, DATA_TYPE 
                    FROM INFORMATION_SCHEMA.PARAMETERS 
                    WHERE SPECIFIC_NAME = ? 
                    AND SPECIFIC_SCHEMA = ?
                    AND PARAMETER_MODE = 'IN' 
                    ORDER BY ORDINAL_POSITION
                ");
                $stmt->execute([$selectedSp, $dbName]);
                $spParams = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
            }

            if (($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'POST' && $selectedSp) {
                try {
                    $execParams = [];
                    foreach ($spParams as $param) {
                        $fieldName = 'param_' . $param['PARAMETER_NAME'];
                        $execParams[] = $_POST[$fieldName] ?? ''; 
                    }

                    $resultRows = call_sp_with_params($pdo, $selectedSp, $execParams);
                    return $resultRows;
                } catch (Throwable $e) {
                    $loadError = $e->getMessage();
                    return [];
                }
            }

            return [];
        },
    ],
    'thong-ke' => [
        'tinh-trang-suc-khoe' => function() use ($pdo) {
            $stmt = $pdo->query('SELECT * FROM VW_THONGKE_TINHTRANGSUCKHOE');
            return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
        },
        'dashboard-tongquan' => function() use ($pdo) {
            $stmt = $pdo->query('SELECT * FROM VW_DASHBOARD_TONGQUAN');
            return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
        },
        'thong-ke-nhan-su' => function() use ($pdo) {
            $stmt = $pdo->query('SELECT * FROM VW_ThongKeNhanSu');
            return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
        },
        'thong-ke-khenthuong' => function() use ($pdo) {
            $stmt = $pdo->query('SELECT * FROM VW_KHENTHUONG');
            return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
        },
        'thong-ke-kyluat' => function() use ($pdo) {
            $stmt = $pdo->query('SELECT * FROM VW_KYLUAT');
            return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
        },
        'tat-ca-view' => function() use ($pdo, $currentRole, &$loadError, &$resultRows, &$viewList, &$selectedDbView) {
            if (!in_array($currentRole, ['hr_role', 'admin_role'], true)) {
                $loadError = 'Bạn không có quyền xem danh sách View.';
                return [];
            }

            $dbName = $pdo->query('SELECT DATABASE()')->fetchColumn();

            $stmt = $pdo->prepare("
                SELECT TABLE_NAME 
                FROM INFORMATION_SCHEMA.VIEWS 
                WHERE TABLE_SCHEMA = ?
                ORDER BY TABLE_NAME
            ");
            $stmt->execute([$dbName]);
            $viewList = $stmt->fetchAll(PDO::FETCH_COLUMN) ?: [];

            $selectedDbView = $_GET['view_name'] ?? '';
            
            if ($selectedDbView && !in_array($selectedDbView, $viewList, true)) {
                $selectedDbView = ''; 
                $loadError = 'View không hợp lệ hoặc không tồn tại.';
            }

            if ($selectedDbView) {
                try {
                    $stmt = $pdo->query("SELECT * FROM `" . $selectedDbView . "` LIMIT 1000");
                    $resultRows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
                    return $resultRows;
                } catch (Throwable $e) {
                    $loadError = $e->getMessage();
                    return [];
                }
            }

            return [];
        },
    ],
];

// Khởi tạo view mặc định an toàn
if (empty($_GET['view']) && isset($routes[$section])) {
    $view = array_key_first($routes[$section]); 
} else {
    $view = isset($_GET['view']) ? (string)$_GET['view'] : '';
}

$allowedItems = $routes[$section] ?? [];
$loadTitle = $view;

if (!isset($allowedItems[$view])) {
    $loadError = 'Không tìm thấy mục yêu cầu.';
} else {
    try {
        $resultRows = $allowedItems[$view]();
    } catch (Throwable $e) {
        $loadError = $e->getMessage();
    }
}

// Cấu trúc phân quyền Menu hiển thị
$menu = [
    'thong-tin-ca-nhan' => [
        'label' => 'Thông tin cá nhân',
        'items' => [
            ['key' => 'canhan-thongtin', 'label' => 'Xem thông tin cá nhân', 'roles' => ['vienchuc_role']],
        ],
    ],
    'hr-procedure' => [
        'label' => 'HR procedure',
        'items' => [
            ['key' => 'them-vien-chuc', 'label' => 'Thêm mới viên chức', 'roles' => ['hr_role', 'admin_role']],
            ['key' => 'vienchuc-dashboard', 'label' => 'Tổng quan viên chức', 'roles' => ['vienchuc_role', 'hr_role', 'admin_role']],
            ['key' => 'vienchuc-lichsu-congtac', 'label' => 'Lịch sử công tác', 'roles' => ['vienchuc_role']],
            ['key' => 'vienchuc-khenthuong', 'label' => 'Khen thưởng', 'roles' => ['vienchuc_role']],
            ['key' => 'vienchuc-kyluat', 'label' => 'Kỷ luật', 'roles' => ['vienchuc_role']],
            ['key' => 'vienchuc-bang', 'label' => 'Bằng (ngoại ngữ/tin học/chuyên môn)', 'roles' => ['vienchuc_role']],
            ['key' => 'hr-sp', 'label' => 'HR SP', 'roles' => ['hr_role', 'admin_role']],
        ],
    ],
    'thong-ke' => [
        'label' => 'Thống kê',
        'items' => [
            ['key' => 'dashboard-tongquan', 'label' => 'Dashboard tổng quan', 'roles' => ['hr_role', 'admin_role', 'thanhtra_role']],
            ['key' => 'tinh-trang-suc-khoe', 'label' => 'Thống kê tình trạng sức khỏe', 'roles' => ['hr_role', 'admin_role', 'thanhtra_role']],
            ['key' => 'thong-ke-nhan-su', 'label' => 'Thống kê nhân sự theo tổ', 'roles' => ['hr_role', 'admin_role', 'thanhtra_role']],
            ['key' => 'thong-ke-khenthuong', 'label' => 'Thống kê khen thưởng', 'roles' => ['hr_role', 'admin_role']],
            ['key' => 'thong-ke-kyluat', 'label' => 'Thống kê kỷ luật', 'roles' => ['hr_role', 'admin_role']],
            ['key' => 'tat-ca-view', 'label' => 'Tất cả View', 'roles' => ['hr_role', 'admin_role']],
        ],
    ],
];

function render_sidebar(array $menu, string $currentRole, string $section, string $view): string {
    ob_start();
    ?>
    <aside class="sidebar">
        <div class="sidebar-title">Menu</div>
        <?php foreach ($menu as $secKey => $sec): ?>
            <?php $sectionAllowed = false; ?>
            <?php foreach ($sec['items'] as $it) { if (in_array($currentRole, $it['roles'], true)) { $sectionAllowed = true; break; } } ?>

            <?php if (!$sectionAllowed) continue; ?>
            <div class="sidebar-section">
                <div class="sidebar-section-label"><?php echo h($sec['label']); ?></div>
                <ul class="sidebar-list">
                    <?php foreach ($sec['items'] as $it): ?>
                        <?php if (!in_array($currentRole, $it['roles'], true)) continue; ?>
                        <?php $active = ($secKey === $section && $it['key'] === $view); ?>
                        <li>
                            <a class="sidebar-link<?php echo $active ? ' active' : ''; ?>" href="/dashboard?section=<?php echo h($secKey); ?>&view=<?php echo h($it['key']); ?>">
                                <?php echo h($it['label']); ?>
                            </a>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </div>
        <?php endforeach; ?>
    </aside>
    <?php
    return (string)ob_get_clean();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Truy cập theo role</title>
    <style>
        :root {
            --bg: #f4f4f9;
            --surface: #ffffff;
            --surface-soft: #f8f9fb;
            --text: #1f2937;
            --muted: #6b7280;
            --line: #d7dce3;
            --primary: #007BFF;
            --primary-dark: #0056b3;
            --shadow: 0 4px 8px rgba(0, 0, 0, 0.08);
        }
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(180deg, #eef2f7 0%, var(--bg) 100%);
            color: var(--text);
            padding: 24px 18px 48px;
        }
        .app {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 270px 1fr;
            gap: 18px;
            align-items: start;
        }
        .topbar {
            grid-column: 1 / -1;
            background: var(--surface);
            border-radius: 16px;
            box-shadow: var(--shadow);
            padding: 16px 18px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
        }
        .topbar h1 { margin: 0; font-size: 1.15rem; }
        .topbar .role {
            color: var(--muted);
            font-size: 0.95rem;
        }
        .topbar .actions { display: flex; gap: 10px; flex-wrap: wrap; }
        .action-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 10px 14px;
            border-radius: 999px;
            border: 1px solid var(--line);
            background: var(--surface-soft);
            color: var(--text);
            text-decoration: none;
            font-size: 0.95rem;
        }
        .action-link.primary {
            background: var(--primary);
            color: #fff;
            border-color: var(--primary);
        }
        .sidebar {
            background: var(--surface);
            border-radius: 16px;
            box-shadow: var(--shadow);
            padding: 14px;
            position: sticky;
            top: 18px;
        }
        .sidebar-title { font-weight: 700; margin-bottom: 12px; }
        .sidebar-section { margin-bottom: 14px; }
        .sidebar-section-label { color: var(--muted); font-weight: 700; margin-bottom: 8px; }
        .sidebar-list { list-style: none; padding: 0; margin: 0; }
        .sidebar-link {
            display: block;
            padding: 10px 10px;
            border-radius: 12px;
            text-decoration: none;
            color: var(--text);
            border: 1px solid transparent;
            margin-bottom: 6px;
        }
        .sidebar-link.active {
            border-color: rgba(0,123,255,0.35);
            background: rgba(0,123,255,0.08);
            color: var(--primary-dark);
            font-weight: 700;
        }
        .content {
            background: var(--surface);
            border-radius: 16px;
            box-shadow: var(--shadow);
            padding: 16px 18px 18px;
        }
        .content h2 { margin: 0 0 10px; }
        .message {
            margin-bottom: 12px;
            padding: 12px 14px;
            border-radius: 10px;
            background: #fff3cd;
            color: #664d03;
            border: 1px solid #ffecb5;
        }
        .message.success {
            background: #d1e7dd;
            color: #0f5132;
            border-color: #badbcc;
        }
        .empty-msg {
            padding: 14px;
            border: 1px dashed var(--line);
            border-radius: 12px;
            color: var(--muted);
            background: #fff;
        }
        .table-wrap { overflow-x: auto; border: 1px solid var(--line); border-radius: 12px; background: #fff; }
        table { width: 100%; border-collapse: collapse; min-width: 720px; }
        th, td { text-align: left; padding: 12px 14px; border-bottom: 1px solid var(--line); vertical-align: top; }
        th { background: #f8fafc; color: #374151; font-size: 0.92rem; white-space: nowrap; }
        tr:hover td { background: #fafcff; }
        
        .form-row { margin-bottom: 12px; }
        .form-row label { display: block; margin-bottom: 6px; font-weight: 500; font-size: 0.95rem; }
        .form-input, .form-select {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--line);
            border-radius: 8px;
            font-size: 0.95rem;
        }

        @media (max-width: 900px) {
            .app { grid-template-columns: 1fr; }
            .sidebar { position: relative; top: 0; }
        }
    </style>
</head>
<body>
<div class="app">
    <div class="topbar">
        <div>
            <h1>Menu theo role</h1>
            <div class="role">Current role (MySQL): <b><?php echo h($currentRole); ?></b></div>
        </div>
        <div class="actions">
            <a class="action-link" href="/home">Quay lại home</a>
            <a class="action-link primary" href="/">Làm mới dashboard</a>
            <a class="action-link" href="/include/logout.php">Đăng xuất</a>
        </div>
    </div>

    <?php echo render_sidebar($menu, $currentRole, $section, $view); ?>

    <main class="content">
        <h2><?php echo $loadError ? 'Lỗi' : h(ucwords(str_replace('-', ' ', $view))); ?></h2>
        
        <?php if (!empty($actionMsg)): ?>
            <div class="message<?php echo $actionStatus ? ' success' : ''; ?>">
                <?php echo h($actionMsg); ?>
            </div>
        <?php endif; ?>

        <?php if ($loadError): ?>
            <div class="message">Không thể tải dữ liệu: <?php echo h($loadError); ?></div>
        <?php endif; ?>

        <?php if ($section === 'hr-procedure' && $view === 'hr-sp'): ?>
            <div class="hr-sp-container">
                <form method="GET" action="/dashboard" style="margin-bottom: 24px;">
                    <input type="hidden" name="section" value="hr-procedure">
                    <input type="hidden" name="view" value="hr-sp">
                    <div class="form-row">
                        <label for="sp_name">Chọn Procedure cần thực thi:</label>
                        <select id="sp_name" name="sp_name" class="form-select" onchange="this.form.submit()">
                            <option value="">-- Click để chọn --</option>
                            <?php foreach ($spList as $sp): ?>
                                <option value="<?php echo h($sp); ?>" <?php echo $sp === $selectedSp ? 'selected' : ''; ?>>
                                    <?php echo h($sp); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </form>

                <?php if ($selectedSp): ?>
                    <form method="POST" action="/dashboard?section=hr-procedure&view=hr-sp&sp_name=<?php echo urlencode($selectedSp); ?>" 
                          style="background: var(--surface-soft); padding: 20px; border-radius: 12px; border: 1px solid var(--line); margin-bottom: 24px;">
                        
                        <input type="hidden" name="sp_name" value="<?php echo h($selectedSp); ?>">
                        <h3 style="margin-top: 0; margin-bottom: 16px; font-size: 1.05rem;">Tham số đầu vào cho <span style="color: var(--primary)"><?php echo h($selectedSp); ?></span></h3>
                        
                        <?php if (empty($spParams)): ?>
                            <div style="color: var(--muted); margin-bottom: 16px; font-style: italic;">
                                Procedure này không yêu cầu tham số truyền vào.
                            </div>
                        <?php else: ?>
                            <div style="display: grid; grid-template-columns: 1fr; gap: 14px; margin-bottom: 20px;">
                                <?php foreach ($spParams as $param): ?>
                                    <div class="form-row" style="margin: 0;">
                                        <label for="param_<?php echo h($param['PARAMETER_NAME']); ?>">
                                            <?php echo h($param['PARAMETER_NAME']); ?> 
                                            <span style="color: var(--muted); font-size: 0.85rem; font-weight: normal;">(<?php echo h($param['DATA_TYPE']); ?>)</span>
                                        </label>
                                        <input id="param_<?php echo h($param['PARAMETER_NAME']); ?>" 
                                               name="param_<?php echo h($param['PARAMETER_NAME']); ?>" 
                                               type="text" 
                                               class="form-input" 
                                               placeholder="Nhập giá trị..."
                                               required />
                                    </div>
                                <?php endforeach; ?>
                            </div>
                        <?php endif; ?>

                        <div style="display: flex; gap: 12px; align-items: center;">
                            <button class="action-link primary" type="submit" style="cursor: pointer; padding: 12px 20px;">Thực thi Procedure</button>
                            <span style="color: var(--muted); font-size: 0.9rem;">
                                If this broke, i'm going to hang myself
                            </span>
                        </div>
                    </form>
                <?php endif; ?>
                
                <?php
                    if (($_SERVER['REQUEST_METHOD'] ?? '') === 'POST' && !$loadError) {
                        if (!empty($resultRows)) {
                            echo '<h3>Kết quả thực thi</h3>';
                            echo render_table($resultRows, 'Không có dữ liệu.');
                        } else {
                            echo '<div class="empty-msg" style="margin-top: 20px; background: #d1e7dd; color: #0f5132; border-color: #badbcc;">
                                    SP  thực thi thành công. (Không có bảng dữ liệu trả về).
                                  </div>';
                        }
                    }
                ?>
            </div>

        <?php elseif ($section === 'hr-procedure' && $view === 'them-vien-chuc'): ?>
    <?php if (!$loadError) require_once __DIR__ . '/them-vienchuc.php'; ?>

        <?php elseif ($view === 'tat-ca-view'): ?>
            <div class="view-container">
                <form method="GET" action="/dashboard" style="margin-bottom: 24px;">
                    <input type="hidden" name="section" value="<?php echo h($section); ?>">
                    <input type="hidden" name="view" value="tat-ca-view">
                    <div class="form-row">
                        <label for="view_name">Chọn View cần xem dữ liệu:</label>
                        <select id="view_name" name="view_name" class="form-select" onchange="this.form.submit()">
                            <option value="">-- Click để chọn View --</option>
                            <?php foreach ($viewList as $v): ?>
                                <option value="<?php echo h($v); ?>" <?php echo $v === $selectedDbView ? 'selected' : ''; ?>>
                                    <?php echo h($v); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </form>

                <?php if ($selectedDbView && !$loadError): ?>
                    <h3 style="margin-top: 0; font-size: 1.05rem;">
                        Dữ liệu từ View: <span style="color: var(--primary);"><?php echo h($selectedDbView); ?></span>
                    </h3>
                    <?php echo render_table($resultRows, 'View này hiện không có dữ liệu.'); ?>
                <?php elseif (!$selectedDbView && !$loadError): ?>
                    <div class="empty-msg">Vui lòng chọn một View ở trên để xem dữ liệu.</div>
                <?php endif; ?>
            </div>

        <?php elseif (!$loadError): ?>
            <?php
                $emptyText = 'Không có dữ liệu.';
                echo render_table($resultRows, $emptyText);
            ?>
        <?php endif; ?>
    </main>
</div>
</body>
</html>