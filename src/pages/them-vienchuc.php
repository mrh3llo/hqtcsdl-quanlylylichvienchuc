<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$old = $_SESSION['old_input'] ?? [];

function old($key, $default = '')
{
    global $old;
    return htmlspecialchars($old[$key] ?? $default, ENT_QUOTES, 'UTF-8');
}
?>

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['btn_them_vienchuc'])) {
    try {
        $imagePath = null;
        if (isset($_FILES['anh_dai_dien']) && $_FILES['anh_dai_dien']['error'] === UPLOAD_ERR_OK) {
            
            // Absolute path inside Docker container (maps to your host system's src folder)
            $uploadDir = '/var/www/html/uploads/pfp/';
            
            // Automatically creates the directories inside the container if they don't exist
            if (!is_dir($uploadDir)) {
                mkdir($uploadDir, 0777, true);
            }

            $fileName = time() . '_' . preg_replace('/[^a-zA-Z0-9_\.]/', '', $_FILES['anh_dai_dien']['name']);
            
            if (move_uploaded_file($_FILES['anh_dai_dien']['tmp_name'], $uploadDir . $fileName)) {
                // The URL web path stored in the database for frontend <img> loading
                $imagePath = '/uploads/pfp/' . $fileName;
            }
        }

        // Sanitizer helper for handling optional date or text parameters securely
        $sanitize = function($key) {
            return (isset($_POST[$key]) && $_POST[$key] !== '') ? $_POST[$key] : null;
        };

        $params = [
            $sanitize('ma_vienchuc'), $sanitize('ma_danhhieu'), $sanitize('ma_tongiao'),
            $sanitize('ma_hocham'), $sanitize('ma_trinhdo'), $sanitize('ma_dantoc'),
            $sanitize('ma_hangthuongbinh'), $sanitize('ma_xaphuong'), $sanitize('xap_maxaphuong'),
            $sanitize('ho'), $sanitize('tenlot'), $sanitize('ten'), $sanitize('tenkhac'),
            $sanitize('ngaysinh'), $sanitize('gioitinh'), $sanitize('ngaytuyendung'),
            $sanitize('sohieuvienchuc'), $imagePath, $sanitize('socccd'),
            $sanitize('noicapcccd'), $sanitize('ngaycapcccd'), $sanitize('sobaohiem'),
            $sanitize('nhommau'), $sanitize('namduocphonghocham'), $sanitize('namduocphongdanhhieu'),
            $_POST['role'] ?? 'vienchuc'
        ];

        $stmt = $pdo->prepare("CALL SP_THEM_VIENCHUC(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        $stmt->execute($params);

        unset($_SESSION['old_input']);

        $_SESSION['action_msg'] = "Thêm viên chức thành công!";
        $_SESSION['action_status'] = true;
    } catch (Throwable $e) {
        $_SESSION['old_input'] = $_POST;
        $_SESSION['action_msg'] = "Lỗi hệ thống: " . $e->getMessage();
        $_SESSION['action_status'] = false;
    }
    echo "<script>window.location.href = '/dashboard?section=hr-procedure&view=them-vien-chuc';</script>";
    exit;
}
?>

<div class="form-them-container">
    <form method="POST" action="/dashboard?section=hr-procedure&view=them-vien-chuc" enctype="multipart/form-data">
        <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 15px;">
            
            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Mã viên chức *</label>
                <input type="text" name="ma_vienchuc" placeholder="Mã VC" value="<?= old('ma_vienchuc') ?>" required class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Số hiệu VC</label>
                <input type="text" name="sohieuvienchuc" placeholder="Số hiệu VC" value="<?= old('sohieuvienchuc') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Số CCCD</label>
                <input type="text" name="socccd" placeholder="Số CCCD" value="<?= old('socccd') ?>" class="form-input">
            </div>
            
            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Họ</label>
                <input type="text" name="ho" placeholder="Họ" value="<?= old('ho') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Tên lót</label>
                <input type="text" name="tenlot" placeholder="Tên lót" value="<?= old('tenlot') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Tên *</label>
                <input type="text" name="ten" placeholder="Tên" value="<?= old('ten') ?>" required class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Tên khác</label>
                <input type="text" name="tenkhac" placeholder="Tên khác" value="<?= old('tenkhac') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Ngày sinh</label>
                <input type="date" name="ngaysinh" placeholder="Ngày sinh" value="<?= old('ngaysinh') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Giới tính</label>
                <select name="gioitinh" class="form-select">
                    <option value="Nam" <?= old('gioitinh', 'Nam') === 'Nam' ? 'selected' : '' ?>>Nam</option>
                    <option value="Nữ" <?= old('gioitinh') === 'Nữ' ? 'selected' : '' ?>>Nữ</option>
                </select>
            </div>
            
            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Mã Danh Hiệu</label>
                <input type="text" name="ma_danhhieu" placeholder="Mã Danh Hiệu" value="<?= old('ma_danhhieu') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Mã Tôn Giáo</label>
                <input type="text" name="ma_tongiao" placeholder="Mã Tôn Giáo" value="<?= old('ma_tongiao') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Mã Học Hàm</label>
                <input type="text" name="ma_hocham" placeholder="Mã Học Hàm" value="<?= old('ma_hocham') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Mã Trình Độ</label>
                <input type="text" name="ma_trinhdo" placeholder="Mã Trình Độ" value="<?= old('ma_trinhdo') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Mã Dân Tộc</label>
                <input type="text" name="ma_dantoc" placeholder="Mã Dân Tộc" value="<?= old('ma_dantoc') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Mã Hạng TB</label>
                <input type="text" name="ma_hangthuongbinh" placeholder="Mã Hạng TB" value="<?= old('ma_hangthuongbinh') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Mã Xã Phường</label>
                <input type="text" name="ma_xaphuong" placeholder="Mã Xã Phường" value="<?= old('ma_xaphuong') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">XAP Mã Xã Phường</label>
                <input type="text" name="xap_maxaphuong" placeholder="XAP Mã Xã Phường" value="<?= old('xap_maxaphuong') ?>" class="form-input">
            </div>
            
            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Ngày tuyển dụng</label>
                <input type="date" name="ngaytuyendung" placeholder="Ngày tuyển dụng" value="<?= old('ngaytuyendung') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Nơi cấp CCCD</label>
                <input type="text" name="noicapcccd" placeholder="Nơi cấp CCCD" value="<?= old('noicapcccd') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Ngày cấp CCCD</label>
                <input type="date" name="ngaycapcccd" placeholder="Ngày cấp CCCD" value="<?= old('ngaycapcccd') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Số bảo hiểm</label>
                <input type="text" name="sobaohiem" placeholder="Số bảo hiểm" value="<?= old('sobaohiem') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Nhóm máu</label>
                <input type="text" name="nhommau" placeholder="Nhóm máu" value="<?= old('nhommau') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Năm phong học hàm</label>
                <input type="date" name="namduocphonghocham" placeholder="Năm phong học hàm" value="<?= old('namduocphonghocham') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Năm phong danh hiệu</label>
                <input type="date" name="namduocphongdanhhieu" placeholder="Năm phong danh hiệu" value="<?= old('namduocphongdanhhieu') ?>" class="form-input">
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Vai trò</label>
                <select name="role" class="form-select">
                    <option value="vienchuc" <?= old('role', 'vienchuc') === 'vienchuc' ? 'selected' : '' ?>>Viên chức</option>
                    <option value="hr" <?= old('role') === 'hr' ? 'selected' : '' ?>>HR</option>
                    <option value="admin" <?= old('role') === 'admin' ? 'selected' : '' ?>>Admin</option>
                </select>
            </div>

            <div class="form-group">
                <label style="display:block; margin-bottom:5px; font-weight:bold;">Ảnh đại diện</label>
                <input type="file" name="anh_dai_dien" class="form-input" accept="image/*">
            </div>
        </div>
        
        <button type="submit" name="btn_them_vienchuc" class="action-link primary" style="width: 100%; margin-top:20px; padding: 15px;">LƯU DỮ LIỆU</button>
    </form>
</div>