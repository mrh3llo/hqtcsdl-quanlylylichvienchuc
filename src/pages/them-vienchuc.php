<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['btn_them_vienchuc'])) {
    try {
        $imagePath = null;
        if (isset($_FILES['anh_dai_dien']) && $_FILES['anh_dai_dien']['error'] === UPLOAD_ERR_OK) {
            $uploadDir = '/var/www/html/uploads/pfp/';
            $fileName = time() . '_' . preg_replace('/[^a-zA-Z0-9_\.]/', '', $_FILES['anh_dai_dien']['name']);
            if (move_uploaded_file($_FILES['anh_dai_dien']['tmp_name'], $uploadDir . $fileName)) {
                $imagePath = '/uploads/pfp/' . $fileName;
            }
        }

        $params = [
            $_POST['ma_vienchuc'] ?? null, $_POST['ma_danhhieu'] ?? null, $_POST['ma_tongiao'] ?? null,
            $_POST['ma_hocham'] ?? null, $_POST['ma_trinhdo'] ?? null, $_POST['ma_dantoc'] ?? null,
            $_POST['ma_hangthuongbinh'] ?? null, $_POST['ma_xaphuong'] ?? null, $_POST['xap_maxaphuong'] ?? null,
            $_POST['ho'] ?? null, $_POST['tenlot'] ?? null, $_POST['ten'] ?? null, $_POST['tenkhac'] ?? null,
            $_POST['ngaysinh'] ?? null, $_POST['gioitinh'] ?? null, $_POST['ngaytuyendung'] ?? null,
            $_POST['sohieuvienchuc'] ?? null, $imagePath, $_POST['socccd'] ?? null,
            $_POST['noicapcccd'] ?? null, $_POST['ngaycapcccd'] ?? null, $_POST['sobaohiem'] ?? null,
            $_POST['nhommau'] ?? null, $_POST['namduocphonghocham'] ?? null, $_POST['namduocphongdanhhieu'] ?? null,
            $_POST['role'] ?? 'vienchuc'
        ];

        $stmt = $pdo->prepare("CALL SP_THEM_VIENCHUC(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        $stmt->execute($params);

        $_SESSION['action_msg'] = "Thêm viên chức thành công!";
        $_SESSION['action_status'] = true;
    } catch (Throwable $e) {
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
            <input type="text" name="ma_vienchuc" placeholder="Mã VC" required class="form-input">
            <input type="text" name="sohieuvienchuc" placeholder="Số hiệu VC" class="form-input">
            <input type="text" name="socccd" placeholder="Số CCCD" class="form-input">
            
            <input type="text" name="ho" placeholder="Họ" class="form-input">
            <input type="text" name="tenlot" placeholder="Tên lót" class="form-input">
            <input type="text" name="ten" placeholder="Tên" required class="form-input">
            <input type="text" name="tenkhac" placeholder="Tên khác" class="form-input">
            <input type="date" name="ngaysinh" placeholder="Ngày sinh" class="form-input">
            <select name="gioitinh" class="form-select"><option value="Nam">Nam</option><option value="Nữ">Nữ</option></select>
            
            <input type="text" name="ma_danhhieu" placeholder="Mã Danh Hiệu" class="form-input">
            <input type="text" name="ma_tongiao" placeholder="Mã Tôn Giáo" class="form-input">
            <input type="text" name="ma_hocham" placeholder="Mã Học Hàm" class="form-input">
            <input type="text" name="ma_trinhdo" placeholder="Mã Trình Độ" class="form-input">
            <input type="text" name="ma_dantoc" placeholder="Mã Dân Tộc" class="form-input">
            <input type="text" name="ma_hangthuongbinh" placeholder="Mã Hạng TB" class="form-input">
            <input type="text" name="ma_xaphuong" placeholder="Mã Xã Phường" class="form-input">
            <input type="text" name="xap_maxaphuong" placeholder="XAP Mã Xã Phường" class="form-input">
            
            <input type="date" name="ngaytuyendung" placeholder="Ngày tuyển dụng" class="form-input">
            <input type="text" name="noicapcccd" placeholder="Nơi cấp CCCD" class="form-input">
            <input type="date" name="ngaycapcccd" placeholder="Ngày cấp CCCD" class="form-input">
            <input type="text" name="sobaohiem" placeholder="Số bảo hiểm" class="form-input">
            <input type="text" name="nhommau" placeholder="Nhóm máu" class="form-input">
            <input type="date" name="namduocphonghocham" placeholder="Năm phong học hàm" class="form-input">
            <input type="date" name="namduocphongdanhhieu" placeholder="Năm phong danh hiệu" class="form-input">
            <select name="role" class="form-select">
                <option value="vienchuc">Viên chức</option><option value="hr">HR</option><option value="admin">Admin</option>
            </select>
            <input type="file" name="anh_dai_dien" class="form-input" accept="image/*">
        </div>
        
        <button type="submit" name="btn_them_vienchuc" class="action-link primary" style="width: 100%; margin-top:20px; padding: 15px;">LƯU DỮ LIỆU</button>
    </form>
</div>