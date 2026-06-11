<?php
if (!isset($pdo)) {
    die("Thiếu kết nối cơ sở dữ liệu.");
}

$stats = [];
$health_data = [];
$basic_info = [];
$work_history = [];
$rewards = [];
$discipline = [];
$load_error = '';

try {
    $stmt_stats = $pdo->query("SELECT * FROM VW_DASHBOARD_TONGQUAN");
    $stats = $stmt_stats->fetch(PDO::FETCH_ASSOC) ?: [];

    $stmt_health = $pdo->query("SELECT * FROM VW_THONGKE_TINHTRANGSUCKHOE");
    $health_data = $stmt_health->fetchAll(PDO::FETCH_ASSOC) ?: [];

    $stmt_sp = $pdo->query("CALL SP_VIENCHUC_DASHBOARD()");

    $basic_info = $stmt_sp->fetchAll(PDO::FETCH_ASSOC) ?: [];
    $stmt_sp->nextRowset();
    $work_history = $stmt_sp->fetchAll(PDO::FETCH_ASSOC) ?: [];
    $stmt_sp->nextRowset();
    $rewards = $stmt_sp->fetchAll(PDO::FETCH_ASSOC) ?: [];
    $stmt_sp->nextRowset();
    $discipline = $stmt_sp->fetchAll(PDO::FETCH_ASSOC) ?: [];
    $stmt_sp->closeCursor();
} catch (PDOException $e) {
    $load_error = $e->getMessage();
}

function render_value($value): string
{
    if ($value === null || $value === '') {
        return '-';
    }

    if (is_bool($value)) {
        return $value ? 'Có' : 'Không';
    }

    if (is_array($value)) {
        return implode(', ', array_map('strval', $value));
    }

    return htmlspecialchars((string) $value, ENT_QUOTES, 'UTF-8');
}

function render_stat_card(string $label, $value, string $tone = ''): string
{
    $safeLabel = htmlspecialchars($label, ENT_QUOTES, 'UTF-8');
    $safeValue = htmlspecialchars((string) ($value ?? 0), ENT_QUOTES, 'UTF-8');
    $toneClass = $tone !== '' ? ' ' . $tone : '';

    return <<<HTML
    <div class="stat-card$toneClass">
        <div class="stat-label">$safeLabel</div>
        <div class="stat-num">$safeValue</div>
    </div>
HTML;
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
                        <th><?php echo htmlspecialchars((string) $header, ENT_QUOTES, 'UTF-8'); ?></th>
                    <?php endforeach; ?>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($rows as $row): ?>
                    <tr>
                        <?php foreach ($headers as $header): ?>
                            <td><?php echo render_value($row[$header] ?? null); ?></td>
                        <?php endforeach; ?>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <?php
    return (string) ob_get_clean();
}

$total_staff = $stats['TONGVIENCHUC'] ?? 0;
$male_staff = $stats['NAM'] ?? 0;
$female_staff = $stats['NU'] ?? 0;
$rewarded_staff = $stats['SO_NGUOI_DUOC_KHENTHUONG'] ?? 0;
$disciplined_staff = $stats['SO_NGUOI_BI_KYLUAT'] ?? 0;
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bảng điều khiển - CSDL VIÊN CHỨC</title>
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
            padding: 32px 18px 48px;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .hero {
            background: var(--surface);
            border-radius: 16px;
            box-shadow: var(--shadow);
            padding: 28px;
            margin-bottom: 20px;
            border-top: 5px solid var(--primary);
        }

        .hero-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 16px;
            flex-wrap: wrap;
        }

        .hero h1 {
            margin: 0 0 8px;
            font-size: 2rem;
            line-height: 1.1;
        }

        .hero p {
            margin: 0;
            color: var(--muted);
            max-width: 760px;
        }

        .hero-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .action-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 10px 16px;
            border-radius: 999px;
            border: 1px solid var(--line);
            background: var(--surface-soft);
            color: var(--text);
            text-decoration: none;
            font-size: 0.95rem;
            transition: background-color 0.2s ease, border-color 0.2s ease, color 0.2s ease;
        }

        .action-link.primary {
            background: var(--primary);
            color: #fff;
            border-color: var(--primary);
        }

        .action-link:hover {
            border-color: var(--primary);
            color: var(--primary-dark);
        }

        .action-link.primary:hover {
            background: var(--primary-dark);
            color: #fff;
        }

        .message {
            margin-bottom: 18px;
            padding: 12px 14px;
            border-radius: 10px;
            background: #fff3cd;
            color: #664d03;
            border: 1px solid #ffecb5;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 16px;
            margin-bottom: 20px;
        }

        .stat-card {
            background: var(--surface);
            padding: 20px;
            border-radius: 14px;
            box-shadow: var(--shadow);
            border-top: 4px solid var(--primary);
        }

        .stat-card.success { border-top-color: #2ecc71; }
        .stat-card.warning { border-top-color: #f59e0b; }
        .stat-card.danger { border-top-color: #e74c3c; }
        .stat-card.neutral { border-top-color: #64748b; }

        .stat-label {
            font-size: 0.92rem;
            color: var(--muted);
            margin-bottom: 8px;
        }

        .stat-num {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text);
        }

        .section-box {
            background: var(--surface);
            border-radius: 14px;
            box-shadow: var(--shadow);
            margin-bottom: 18px;
            overflow: hidden;
        }

        .section-header {
            padding: 18px 20px 0;
        }

        .section-header h2 {
            margin: 0 0 6px;
            font-size: 1.2rem;
        }

        .section-header p {
            margin: 0 0 16px;
            color: var(--muted);
            font-size: 0.95rem;
        }

        .section-body {
            padding: 0 20px 20px;
        }

        .table-wrap {
            overflow-x: auto;
            border: 1px solid var(--line);
            border-radius: 12px;
            background: #fff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 720px;
        }

        th, td {
            text-align: left;
            padding: 12px 14px;
            border-bottom: 1px solid var(--line);
            vertical-align: top;
        }

        th {
            background: #f8fafc;
            color: #374151;
            font-size: 0.92rem;
            white-space: nowrap;
        }

        tr:hover td {
            background: #fafcff;
        }

        .empty-msg {
            padding: 14px;
            border: 1px dashed var(--line);
            border-radius: 12px;
            color: var(--muted);
            background: #fff;
        }

        .grid-two {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px;
        }

        @media (max-width: 900px) {
            .grid-two { grid-template-columns: 1fr; }
            .hero h1 { font-size: 1.7rem; }
        }

        @media (max-width: 640px) {
            body { padding: 16px 12px 28px; }
            .hero, .section-header, .section-body { padding-left: 16px; padding-right: 16px; }
            .hero { padding: 18px; }
            .stats-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <div class="hero">
        <div class="hero-top">
            <div>
                <h1>Bảng điều khiển CSDL</h1>
                <p>Tổng quan cơ sở dữ liệu viên chức, với khả năng truy cập nhanh đến tổng số viên chức, phân bố tình trạng sức khỏe và thông tin hồ sơ hiện tại của bạn.</p>
            </div>
            <div class="hero-actions">
                <a class="action-link primary" href="/">Làm mới bảng điều khiển</a>
                <a class="action-link" href="/include/logout.php">Đăng xuất</a>
            </div>
        </div>
    </div>

    <?php if (!empty($load_error)): ?>
        <div class="message">Lỗi khi tải dữ liệu bảng điều khiển: <?php echo htmlspecialchars($load_error, ENT_QUOTES, 'UTF-8'); ?></div>
    <?php endif; ?>

    <div class="stats-grid">
        <?php
            echo render_stat_card('Tổng số viên chức', $total_staff, 'neutral');
            echo render_stat_card('Nam', $male_staff, 'success');
            echo render_stat_card('Nữ', $female_staff, 'warning');
            echo render_stat_card('Được khen thưởng', $rewarded_staff, 'success');
            echo render_stat_card('Bị kỷ luật', $disciplined_staff, 'danger');
        ?>
    </div>

    <div class="grid-two">
        <section class="section-box">
            <div class="section-header">
                <h2>Phân bố tình trạng sức khỏe</h2>
                <p>Số lượng tổng hợp theo từng tình trạng sức khỏe từ dữ liệu thống kê.</p>
            </div>
            <div class="section-body">
                <?php echo render_table($health_data, 'Không có dữ liệu thống kê sức khỏe.'); ?>
            </div>
        </section>

        <section class="section-box">
            <div class="section-header">
                <h2>Thông tin viên chức hiện tại</h2>
                <p>Tập kết quả đầu tiên từ thủ tục lưu trữ, thường là hồ sơ của tài khoản hiện tại.</p>
            </div>
            <div class="section-body">
                <?php echo render_table($basic_info, 'Không có dữ liệu hồ sơ viên chức.'); ?>
            </div>
        </section>
    </div>

    <section class="section-box">
        <div class="section-header">
            <h2>Quá trình công tác</h2>
            <p>Lịch sử hợp đồng, bổ nhiệm hoặc công tác trong tổ chức được trả về từ thủ tục lưu trữ.</p>
        </div>
        <div class="section-body">
            <?php echo render_table($work_history, 'Không có dữ liệu quá trình công tác.'); ?>
        </div>
    </section>

    <div class="grid-two">
        <section class="section-box">
            <div class="section-header">
                <h2>Khen thưởng</h2>
                <p>Các hồ sơ khen thưởng của viên chức hiện tại.</p>
            </div>
            <div class="section-body">
                <?php echo render_table($rewards, 'Không có dữ liệu khen thưởng.'); ?>
            </div>
        </section>

        <section class="section-box">
            <div class="section-header">
                <h2>Kỷ luật</h2>
                <p>Các hồ sơ kỷ luật của viên chức hiện tại.</p>
            </div>
            <div class="section-body">
                <?php echo render_table($discipline, 'Không có dữ liệu kỷ luật.'); ?>
            </div>
        </section>
    </div>
</div>
</body>
</html>