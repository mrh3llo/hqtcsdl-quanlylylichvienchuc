USE CSDL_VIEN_CHUC;

-- ----------- Tỉnh thành, xã phường -------------
CREATE TABLE TinhThanh (
    MaTinhThanh CHAR(5) PRIMARY KEY,
    TenTinhThanh NVARCHAR(30) NOT NULL);

CREATE TABLE XaPhuong (
    MaXaPhuong CHAR(5) PRIMARY KEY,
    TenXaPhuong NVARCHAR(30) NOT NULL,
    MaTinhThanh CHAR(5) NOT NULL,
    FOREIGN KEY (MaTinhThanh) REFERENCES TinhThanh(MaTinhThanh));


-- -------- DÂN TỘC, TÔN GIÁO -------------
CREATE TABLE DanToc (
    MaDanToc CHAR(5) PRIMARY KEY,
    TenDanToc NVARCHAR(30) NOT NULL);

CREATE TABLE TonGiao (
    MaTonGiao CHAR(5) PRIMARY KEY,
    TenTonGiao NVARCHAR(30) NOT NULL);


-- ------------ Nghề nghiệp, cơ quan, chức danh nghề nghiệp -------------
CREATE TABLE NgheNghiep (
    MaNgheNghiep CHAR(5) PRIMARY KEY,
    TenNgheNghiep NVARCHAR(30) NOT NULL);


CREATE TABLE CoQuan (
    MaCoQuan CHAR(5) PRIMARY KEY,
    TenCoQuan NVARCHAR(30) NOT NULL);


CREATE TABLE ChucDanhNgheNghiep (
    MaChucDanhNgheNghiep CHAR(5) PRIMARY KEY,
    ChucDanhNgheNghiep NVARCHAR(30) NOT NULL,
    BacLuong TINYINT NOT NULL,
    HeSoLuong DECIMAL(5,3) NOT NULL,
    NgayHuongLuong DATE NOT NULL,
    PhuCapChucDanh DECIMAL(5,3) NOT NULL,
    PhuCapKhac DECIMAL(5,3));


-- --------- Hạng thương binh--------
CREATE TABLE HangThuongBinh (
    MaHangThuongBinh CHAR(5) PRIMARY KEY,
    TenHangThuongBinh NVARCHAR(30) NOT NULL);


-- ------- Cấp lý luận chính trị, chuyên môn, ngoại ngữ, tin học -------------
CREATE TABLE CapLyLuanChinhTri (
    MaCap CHAR(5) PRIMARY KEY,
    TenCap NVARCHAR(30) NOT NULL);

CREATE TABLE ChuyenMon(
    MaChuyenMon CHAR(5) PRIMARY KEY,
    TenChuyenMon NVARCHAR(30) NOT NULL);

CREATE TABLE NgoaiNgu (
    MaNgoaiNgu CHAR(5) PRIMARY KEY,
    TenNgoaiNgu NVARCHAR(30) NOT NULL);

CREATE TABLE ChungChiTinHoc (
    MaChungChi CHAR(5) PRIMARY KEY,
    TenChungChi NVARCHAR(30) NOT NULL);


-- --------Danh Hiệu Học hàm -------------
CREATE TABLE HocHam (
    MaHocHam CHAR(5) PRIMARY KEY,
    TenHocHam NVARCHAR(30) NOT NULL);

CREATE TABLE DanhHieu(
    MaDanhHieu CHAR(5) PRIMARY KEY,
    TenDanhHieu NVARCHAR(30) NOT NULL);


-- ---- Hinh thức khen thưởng, kỷ luật -------------
CREATE TABLE HinhThucKhenThuong_KyLuat (
    MaHinhThuc CHAR(5) PRIMARY KEY,
    TenHinhThuc NVARCHAR(30) NOT NULL);


-- -----Quân hàm bảo hiểm---------
CREATE TABLE QuanHam(
    MaQuanHam CHAR(5) PRIMARY KEY,
    TenQuanHam NVARCHAR(30) NOT NULL);

CREATE TABLE BaoHiem (
    MaBaoHiem CHAR(5) PRIMARY KEY,
    TenBaoHiem NVARCHAR(30) NOT NULL);
