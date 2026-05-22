USE CSDL_VIEN_CHUC;

CREATE TABLE VienChuc (
    MaVienChuc CHAR(10) PRIMARY KEY,
    Ho NVARCHAR(20) NOT NULL,
    TenLot NVARCHAR(40),
    Ten NVARCHAR(20) NOT NULL,
    TenKhac NVARCHAR(100), 
    NgaySinh DATE NOT NULL,
    GioiTinh NVARCHAR(3) NOT NULL, 
    NoiSinh_XaPhuong CHAR(5) NOT NULL,
    NoiSinh_TinhThanh CHAR(5) NOT NULL,
    -- ----- Quê quán -----------
    QueQuan_XaPhuong CHAR(5) NOT NULL,
    QueQuan_TinhThanh CHAR(5) NOT NULL,
    -- ------------------------
    DanToc CHAR(5) NOT NULL,
    TonGiao CHAR(5) NOT NULL,
    HokhauThuongTru NVARCHAR(300) NOT NULL,
    NoiOHienTai NVARCHAR(300) NOT NULL,
    -- ----- Công Việc -----------
    NgheNghiepKhiTuyenDung CHAR(5),
    NgayTuyenDung DATE NOT NULL,
    CoQuanTuyenDung CHAR(5) NOT NULL,
    ChucDanhHienTai CHAR(5) NOT NULL,
    ChucDanhKiemNhiem CHAR(5) NOT NULL,
    CongViecChinh CHAR(5) NOT NULL,
    SoHieuVienChuc CHAR(10) NOT NULL,
    UNIQUE (SoHieuVienChuc),
    AnhDaiDien NVARCHAR(300),
    FOREIGN KEY (NoiSinh_XaPhuong) REFERENCES XaPhuong(MaXaPhuong),
    FOREIGN KEY (NoiSinh_TinhThanh) REFERENCES TinhThanh(MaTinhThanh),
    FOREIGN KEY (QueQuan_XaPhuong) REFERENCES XaPhuong(MaXaPhuong),
    FOREIGN KEY (QueQuan_TinhThanh) REFERENCES TinhThanh(MaTinhThanh),
    FOREIGN KEY (DanToc) REFERENCES DanToc(MaDanToc),
    FOREIGN KEY (TonGiao) REFERENCES TonGiao(MaTonGiao),
    FOREIGN KEY (NgheNghiepKhiTuyenDung) REFERENCES NgheNghiep(MaNgheNghiep),
    FOREIGN KEY (CoQuanTuyenDung) REFERENCES CoQuan(MaCoQuan),
    FOREIGN KEY (ChucDanhHienTai) REFERENCES ChucDanhNgheNghiep(MaChucDanhNgheNghiep),
    FOREIGN KEY (ChucDanhKiemNhiem) REFERENCES ChucDanhNgheNghiep(MaChucDanhNgheNghiep),
    FOREIGN KEY (CongViecChinh) REFERENCES ChucDanhNgheNghiep(MaChucDanhNgheNghiep));


-- --------------Khen Thưởng--------------
CREATE TABLE KhenThuong_KyLuat (
    MaKTKL CHAR(5) PRIMARY KEY,
    HinhThucKhenThuong CHAR(5),
    NamKhenThuong DATE,
    HinhThucKyLuat CHAR(5),
    NamKyLuat DATE,
    MaVienChuc CHAR(10) NOT NULL,
    FOREIGN KEY (HinhThucKhenThuong) REFERENCES HinhThucKhenThuong_KyLuat(MaHinhThuc),
    FOREIGN KEY (HinhThucKyLuat) REFERENCES HinhThucKhenThuong_KyLuat(MaHinhThuc),
    FOREIGN KEY (MaVienChuc) REFERENCES VienChuc(MaVienChuc));


-- --- Sức Khỏe -------------
CREATE TABLE TinhTrangSucKhoe (
    MaSucKhoe CHAR(5) PRIMARY KEY,
    ChieuCao INT NOT NULL,
    CanNang DECIMAL(5,2) NOT NULL,
    NhomMau CHAR(5),
    MaHangThuongBinh CHAR(5),
    LaConGiaDinhChinhSach BIT NOT NULL,
    MaVienChuc CHAR(10) NOT NULL,
    FOREIGN KEY (MaHangThuongBinh) REFERENCES HangThuongBinh(MaHangThuongBinh),
    FOREIGN KEY (MaVienChuc) REFERENCES VienChuc(MaVienChuc));

-- ---- TRình độ học vấn,  -------------
CREATE TABLE TrinhDoHocVan (
    MaTrinhDo CHAR(5) PRIMARY KEY,
    TrinhDoGiaoDucQuocPhong CHAR(5),
    TrinhDoChuyenMonCaoNhat CHAR(5),
    LyLuanChinhTri CHAR(5),
    QuanLyNhaNuoc CHAR(5),
    TrinhDoNghiepVuChuyenNganh NVARCHAR(100),
    NgoaiNgu CHAR(5),
    TinHoc CHAR(5),
    MaVienChuc CHAR(10) NOT NULL,
    FOREIGN KEY (TrinhDoGiaoDucQuocPhong) REFERENCES CapLyLuanChinhTri(MaCap),
    FOREIGN KEY (TrinhDoChuyenMonCaoNhat) REFERENCES ChuyenMon(MaChuyenMon),
    FOREIGN KEY (LyLuanChinhTri) REFERENCES CapLyLuanChinhTri(MaCap),
    FOREIGN KEY (QuanLyNhaNuoc) REFERENCES CapLyLuanChinhTri(MaCap), -- --- Khó hiểu
    FOREIGN KEY (NgoaiNgu) REFERENCES NgoaiNgu(MaNgoaiNgu),
    FOREIGN KEY (TinHoc) REFERENCES ChungChiTinHoc(MaChungChi),
    FOREIGN KEY (MaVienChuc) REFERENCES VienChuc(MaVienChuc));


-- ----- Danh hiệu, học hàm -------------
CREATE TABLE DanhHieu_HocHam (
    MaDanhHieu CHAR(5) PRIMARY KEY,
    DanhHieuDuocPhongCaoNhat CHAR(5),
    HocHamDuocPhong CHAR(5),
    NamDuocPhong DATE,
    MaVienChuc CHAR(10) NOT NULL,
    FOREIGN KEY (DanhHieuDuocPhongCaoNhat) REFERENCES DanhHieu(MaDanhHieu),
    FOREIGN KEY (HocHamDuocPhong) REFERENCES HocHam(MaHocHam),
    FOREIGN KEY (MaVienChuc) REFERENCES VienChuc(MaVienChuc));


-- ---- Thong tin Dang Quan doi--------------
CREATE TABLE ThongTinDangQuanDoi (
    MaTTDQD CHAR(5) PRIMARY KEY,
    NgayVaoDang DATE,
    NgayChinhThuc DATE,
    NgayThamGiaToChucChinhTriXaHoi DATE,
    NgayNhapNgu DATE,
    NgayXuatNgu DATE,
    QuanHamCaoNhat CHAR(5),
    MaVienChuc CHAR(10) NOT NULL,
    FOREIGN KEY (QuanHamCaoNhat) REFERENCES QuanHam(MaQuanHam),
    FOREIGN KEY (MaVienChuc) REFERENCES VienChuc(MaVienChuc));


-- -- Giấy tờ nhân thân -------------
CREATE TABLE GiayToNhanThan (
    MaGiayTo CHAR(5) PRIMARY KEY,
    SoCCCD CHAR(10) NOT NULL,
    NgayCapCCCD DATE NOT NULL,
    MaCoQuanCapCCCD CHAR(5) NOT NULL,
    MaBaoHiem CHAR(5) NOT NULL,
    MaVienChuc CHAR(10) NOT NULL,
    FOREIGN KEY (MaBaoHiem) REFERENCES BaoHiem(MaBaoHiem),
    FOREIGN KEY (MaCoQuanCapCCCD) REFERENCES CoQuan(MaCoQuan),
    FOREIGN KEY (MaVienChuc) REFERENCES VienChuc(MaVienChuc));
