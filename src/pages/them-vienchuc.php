<?php
require_once __DIR__ . '/../include/db.inc.php';

// Hàm helper để làm sạch dữ liệu đầu vào
function get_post_val(string $key, string $default = ''): string {
    return isset($_POST[$key]) ? trim((string)$_POST[$key]) : $default;
}

$message = '';
$isSuccess = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        // 1. Xử lý Upload Ảnh Đại Diện
        $anhDaiDienPath = ''; 
        if (isset($_FILES['ANHDAIDIEN']) && $_FILES['ANHDAIDIEN']['error'] === UPLOAD_ERR_OK) {
            $fileTmpPath = $_FILES['ANHDAIDIEN']['tmp_name'];
            $fileName = $_FILES['ANHDAIDIEN']['name'];
            $fileExtension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
            
            // Các định dạng ảnh cho phép
            $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
            
            if (in_array($fileExtension, $allowedExtensions, true)) {
                // Đổi tên file bằng mã viên chức + thời gian để tránh trùng lặp
                $maVienChuc = get_post_val('MAVIENCHUC');
                $newFileName = 'vc_' . $maVienChuc . '_' . time() . '.' . $fileExtension;
                $uploadFileDir = __DIR__ . '/uploads/';
                
                if (!is_dir($uploadFileDir)) {
                    mkdir($uploadFileDir, 0755, true);
                }
                
                $destPath = $uploadFileDir . $newFileName;
                if (move_uploaded_path($fileTmpPath, $destPath)) {
                    // Lưu đường dẫn tương đối vào Database
                    $anhDaiDienPath = '/uploads/' . $newFileName;
                } else {
                    throw new Exception('Không thể di chuyển file ảnh vào thư mục lưu trữ.');
                }
            } else {
                throw new Exception('Định dạng ảnh không hợp lệ. Chỉ chấp nhận JPG, JPEG, PNG, GIF, WEBP.');
            }
        }

        // 2. Thu thập toàn bộ tham số từ Form
        $params = [
            'p_MAVIENCHUC'           => get_post_val('MAVIENCHUC'),
            'p_MADANHHIEU'           => get_post_val('MADANHHIEU') ?: null,
            'p_MATONGIAO'            => get_post_val('MATONGIAO') ?: null,
            'p_MAHOCHAM'             => get_post_val('MAHOCHAM') ?: null,
            'p_MATRINHDO'            => get_post_val('MATRINHDO') ?: null,
            'p_MADANTOC'             => get_post_val('MADANTOC') ?: null,
            'p_MAHANGTHUONGBINH'     => get_post_val('MAHANGTHUONGBINH') ?: null,
            'p_MAXAPHUONG'           => get_post_val('MAXAPHUONG') ?: null,
            'p_XAP_MAXAPHUONG'       => get_post_val('XAP_MAXAPHUONG') ?: null,
            'p_HO'                   => get_post_val('HO'),
            'p_TENLOT'               => get_post_val('TENLOT'),
            'p_TEN'                  => get_post_val('TEN'),
            'p_TENKHAC'              => get_post_val('TENKHAC') ?: null,
            'p_NGAYSINH'             => get_post_val('NGAYSINH') ?: null,
            'p_GIOITINH'             => get_post_val('GIOITINH'),
            'p_NGAYTUYENDUNG'        => get_post_val('NGAYTUYENDUNG') ?: null,
            'p_SOHIEUVIENCHUC'       => get_post_val('SOHIEUVIENCHUC') ?: null,
            'p_ANHDAIDIEN'           => $anhDaiDienPath ?: null, // Đường dẫn ảnh vừa upload
            'p_SOCCCD'               => get_post_val('SOCCCD') ?: null,
            'p_NOICAPCCCD'           => get_post_val('NOICAPCCCD') ?: null,
            'p_NGAYCAPCCCD'          => get_post_val('NGAYCAPCCCD') ?: null,
            'p_SOBAOHIEM'            => get_post_val('SOBAOHIEM') ?: null,
            'p_NHOMMAU'              => get_post_val('NHOMMAU') ?: null,
            'p_NAMDUOCPHONGHOCHAM'   => get_post_val('NAMDUOCPHONGHOCHAM') ?: null,
            'p_NAMDUOCPHONGDANHHIEU' => get_post_val('NAMDUOCPHONGDANHHIEU') ?: null,
            'p_role'                 => get_post_val('role')
        ];

        // Validate bắt buộc các trường nền tảng
        if (empty($params['p_MAVIENCHUC']) || empty($params['p_HO']) || empty($params['p_TEN']) || empty($params['p_role'])) {
            throw new Exception('Vui lòng điền đầy đủ các trường bắt buộc (*): Mã viên chức, Họ, Tên, và Vai trò.');
        }

        // 3. Chuẩn bị gọi Stored Procedure SP_THEM_VIENCHUC (26 tham số)
        $placeholders = implode(',', array_fill(0, count($params), '?'));
        $sql = "CALL SP_THEM_VIENCHUC($placeholders)";
        
        $stmt = $pdo->prepare($sql);
        $stmt->execute(array_values($params));
        
        $message = "Thêm mới viên chức và cấp tài khoản hệ thống thành công!";
        $isSuccess = true;
    } catch (Throwable $e) {
        $message = " Lỗi: " . $e->getMessage();
    }
}

// Chuyển hướng về lại dashboard kèm thông báo thông qua Session
session_start();
$_SESSION['action_msg'] = $message;
$_SESSION['action_status'] = $isSuccess;
header("Location: /dashboard?section=hr-procedure&view=them-vien-chuc");
exit;