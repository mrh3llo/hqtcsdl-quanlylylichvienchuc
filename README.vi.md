# 📋 HTCSDL_Quan_ly_Lich_vien_Chuc

> **Hệ thống Quản lý Hồ sơ Lý lịch Viên chức** Một hệ thống cơ sở dữ liệu MySQL toàn diện, được chuẩn hóa và tích hợp trong ứng dụng web PHP triển khai bằng Docker nhằm quản lý hiệu quả hồ sơ viên chức, tự động hóa các quy trình nhân sự và hỗ trợ nhập liệu hàng loạt một cách liền mạch.

### Ngôn ngữ: [![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/mrh3llo/hqtcsdl-quanlylylichvienchuc/blob/master/README.md)
---

## 📌 Tổng quan & Mục tiêu

Kho lưu trữ này chứa toàn bộ thiết kế cơ sở dữ liệu và triển khai container hóa cho hệ thống quản lý hồ sơ lý lịch viên chức.

### 🎯 Mục tiêu chính:
* **Lưu trữ có cấu trúc:** Xây dựng cơ sở dữ liệu MySQL được chuẩn hóa ở mức cao nhằm giảm thiểu dư thừa dữ liệu và đảm bảo tính toàn vẹn cho hồ sơ nhân sự của tổ chức.
* **Tự động hóa nghiệp vụ:** Triển khai logic nghiệp vụ mạnh mẽ ở cấp cơ sở dữ liệu bằng cách sử dụng **Views**, **Triggers** và **Stored Procedures**.
* **Tối ưu hóa nhập dữ liệu:** Hỗ trợ tải lên dữ liệu hàng loạt từ các tệp CSV có cấu trúc một cách đáng tin cậy.
* **Triển khai biệt lập:** Cung cấp môi trường chạy cục bộ sẵn sàng cho doanh nghiệp dựa trên **Docker Compose**.

---

## ✨ Tính năng

* 🛠️ **Lược đồ MySQL mạnh mẽ:** Cơ sở dữ liệu quan hệ được khởi tạo đầy đủ để xử lý các hồ sơ viên chức phức tạp.
* 📊 **Views tối ưu hóa:** Các khung nhìn được biên dịch sẵn nhằm hỗ trợ báo cáo dữ liệu nhanh chóng, an toàn và tổng hợp.
* ⚡ **Triggers tự động:** Kiểm tra tính hợp lệ của dữ liệu theo thời gian thực và thực thi các ràng buộc toàn vẹn trực tiếp tại tầng cơ sở dữ liệu.
* 💼 **Stored Procedures cho nghiệp vụ nhân sự:** Các thủ tục hiệu năng cao hỗ trợ CRUD, nâng ngạch, thăng chức và điều chuyển tổ chức.
* 📥 **Bộ nhập dữ liệu hàng loạt tự động:** Tiện ích PHP chuyên dụng để phân tích và nạp dữ liệu vào MySQL một cách tự động.
* 🐳 **Kiến trúc ưu tiên Docker:** Hệ thống vi dịch vụ gồm (`MySQL 8.4`, `PHP/Apache` và dịch vụ `Importer` tạm thời).

---

## 📂 Cấu trúc kho lưu trữ

```text
├── 🐳 docker-compose.yaml      # Tệp cấu hình điều phối Docker đa container
├── 📦 dockerfile               # Bản dựng PHP-Apache tùy chỉnh với phần mở rộng PDO MySQL
├── 🗄️ DB/                      # Tầng Cơ sở Dữ liệu
│   ├── DB_innit.sql            # Định nghĩa lược đồ DDL và các bảng
│   ├── DB_views.sql            # Các lớp khung nhìn phục vụ báo cáo
│   ├── DB_triggers.sql         # Các quy tắc toàn vẹn dựa trên sự kiện
│   ├── DB_roles.sql            # Phân quyền người dùng và cấu hình RBAC
│   └── HR_procedure.sql        # Các thao tác quản trị cấp cao
├── 🌐 src/                     # Tầng Ứng dụng Web
│   ├── index.php               # Điểm khởi chạy chính của ứng dụng
│   ├── include/
│   │   └── db.inc.php          # Lớp trừu tượng PDO và bộ quản lý kết nối CSDL
│   └── Data/                   # Công cụ dữ liệu và khởi tạo dữ liệu
│       ├── importdata.php      # Bộ thực thi nhập dữ liệu hàng loạt
│       └── csv/                # Các tập dữ liệu thô được phân loại
└── 🧪 test/                    # Công cụ kiểm thử và tập lệnh xác minh
```

## Yêu cầu

- Docker Engine
- Docker Compose
- Tùy chọn: PHP và MySQL cài đặt cục bộ để chạy thủ công

## Cài đặt

### 1. Sao chép kho lưu trữ

```bash
git clone https://link-to-project
cd hqtcsdl-quanlylichvienchuc
```

### 2. Cấu hình biến môi trường

Tạo tệp `.env` hoặc xuất các biến môi trường cho Docker Compose. Các biến bắt buộc:

- `MYSQL_ROOT_PASSWORD` — mật khẩu tài khoản root của MySQL
- `MYSQL_PORT` — cổng truy cập MySQL trên máy cục bộ (ví dụ: `3306`)
- `PHP_PORT` — cổng cho máy chủ web PHP (ví dụ: `8080`)

Ví dụ tệp `.env`:

```ini
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_PORT=3306
PHP_PORT=8080
```

### 3. Khởi động ứng dụng bằng Docker Compose

```bash
docker compose up -d
```

Lệnh này sẽ khởi chạy ba dịch vụ:

- `mysql` — máy chủ cơ sở dữ liệu MySQL 8.4
- `php` — máy chủ web PHP/Apache lưu trữ thư mục `src/`
- `importer` — nhập dữ liệu CSV sau khi cơ sở dữ liệu sẵn sàng

### 4. Kiểm tra trạng thái dịch vụ

```bash
docker compose ps
```

### 5. Truy cập ứng dụng web

Mở trình duyệt và truy cập:

```text
http://localhost:8080
```

💡 Hướng dẫn sử dụng & bảo trì

### ⚙️ Thứ tự thực thi khởi tạo cơ sở dữ liệu tự động

Khi các container khởi động, lược đồ cơ sở dữ liệu quan hệ sẽ được xây dựng theo đúng thứ tự sau:

- `DB_innit.sql` (Các bảng và mối quan hệ chính)
- `DB_views.sql` (Các lớp biểu diễn dữ liệu tổng hợp)
- `DB_triggers.sql` (Các quy tắc kiểm tra và xác thực tự động)
- `DB_roles.sql` (Vai trò, quyền hạn và ngữ cảnh bảo mật)
- `HR_procedure.sql` (Các điểm cuối của tầng API chức năng)

### Nhập dữ liệu

Dịch vụ `importer` sẽ thực thi lệnh `php /var/www/html/Data/importdata.php` sau khi cơ sở dữ liệu sẵn sàng. Dữ liệu CSV từ `src/Data/csv/` sẽ được nạp vào cơ sở dữ liệu.

### 🔌 Gỡ lỗi kết nối cơ sở dữ liệu thủ công

Nếu cần truy cập trực tiếp vào hệ quản trị cơ sở dữ liệu từ terminal của máy chủ để kiểm tra các ràng buộc:

```bash
mysql -h 127.0.0.1 -P ${MYSQL_PORT} -u root -p
```

## 📝 Hướng dẫn kiến trúc

**Cấu hình thông tin đăng nhập cơ sở dữ liệu:** Được quản lý tập trung trong `src/include/db.inc.php`. Hãy đảm bảo đồng bộ với các thay đổi trong tệp `.env`.

**Biện pháp chống Race Condition:** Container nhập dữ liệu sử dụng cơ chế trì hoãn tích hợp nhằm đảm bảo MySQL đã hoàn tất quá trình khởi tạo bảng trước khi bắt đầu nạp dữ liệu.

## Ghi chú

- Điểm khởi chạy chính của ứng dụng PHP là `src/index.php`.
- Cấu hình kết nối cơ sở dữ liệu được quản lý trong `src/include/db.inc.php`.
- Container nhập dữ liệu sẽ chờ trong một khoảng thời gian ngắn trước khi thực thi tập lệnh nhập liệu nhằm đảm bảo MySQL đã sẵn sàng.

## 📐 Kiến trúc hệ thống & Thiết kế cơ sở dữ liệu

### 🗺️ Sơ đồ Thực thể - Liên kết (ERD)

Vui lòng tham khảo tệp DRG để biết chi tiết, vì cơ sở dữ liệu chứa quá nhiều thực thể để có thể theo dõi đầy đủ trong một sơ đồ duy nhất.

## Kết luận

Dự án này ứng dụng cho việc quản lý hồ sơ viên chức bằng cơ sở dữ liệu MySQL ở phía backend và giao diện PHP ở phía frontend. Hệ thống được thiết kế phục vụ phát triển và kiểm thử cục bộ thông qua Docker Compose.
