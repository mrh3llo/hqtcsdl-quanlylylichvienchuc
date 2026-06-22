/* DBMS name:      MySQL                                       */
/* Converted for MySQL compatibility                           */
/*==============================================================*/
CREATE DATABASE IF NOT EXISTS CSDL_VIEN_CHUC;
USE CSDL_VIEN_CHUC;
;


DROP TABLE IF EXISTS BACLUONG
;

DROP INDEX IF EXISTS BI_KYLUAT.BI_KYLUAT2_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('BI_KYLUAT')
            and   name  = 'BI_KYLUAT_FK'
            and   indid > 0
            and   indid < 255)
   drop index BI_KYLUAT.BI_KYLUAT_FK
;

DROP TABLE IF EXISTS BI_KYLUAT
;

DROP TABLE IF EXISTS CAPLYLUANCHINHTRI
;

DROP TABLE IF EXISTS CAPQUANLYNHANUOC
;

DROP TABLE IF EXISTS CHITIETLUONG
;

DROP TABLE IF EXISTS CHUCDANH_NGHENGHIEP
;

DROP TABLE IF EXISTS CHUCVU
;

DROP TABLE IF EXISTS CHUNGCHITINHOC
;

DROP TABLE IF EXISTS CHUYENMON
;

DROP TABLE IF EXISTS COQUAN
;

DROP INDEX IF EXISTS CO_CAPLYLUANCHINHTRI.CO_CAPLYLUANCHINHTRI2_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CAPLYLUANCHINHTRI')
            and   name  = 'CO_CAPLYLUANCHINHTRI_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CAPLYLUANCHINHTRI.CO_CAPLYLUANCHINHTRI_FK
;

DROP TABLE IF EXISTS CO_CAPLYLUANCHINHTRI
;

DROP INDEX IF EXISTS CO_CAPQUANLYNHANUOC.CO_CAPQUANLYNHANUOC2_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CAPQUANLYNHANUOC')
            and   name  = 'CO_CAPQUANLYNHANUOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CAPQUANLYNHANUOC.CO_CAPQUANLYNHANUOC_FK
;

DROP TABLE IF EXISTS CO_CAPQUANLYNHANUOC
;

DROP INDEX IF EXISTS CO_CHUCVU.CO_CHUCVU4_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CHUCVU')
            and   name  = 'CO_CHUCVU3_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CHUCVU.CO_CHUCVU3_FK
;

DROP INDEX IF EXISTS CO_CHUCVU.CO_CHUCVU2_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CHUCVU')
            and   name  = 'CO_CHUCVU_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CHUCVU.CO_CHUCVU_FK
;

DROP TABLE IF EXISTS CO_CHUCVU
;

DROP INDEX IF EXISTS CO_HESOLUONG.CO_HESOLUONG3_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_HESOLUONG')
            and   name  = 'CO_HESOLUONG2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_HESOLUONG.CO_HESOLUONG2_FK
;

DROP INDEX IF EXISTS CO_HESOLUONG.CO_HESOLUONG_FK
;

DROP TABLE IF EXISTS CO_HESOLUONG
;

DROP INDEX IF EXISTS CO_HOKHAUTHUONGTRU.CO_HOKHAUTHUONGTRU2_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_HOKHAUTHUONGTRU')
            and   name  = 'CO_HOKHAUTHUONGTRU_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_HOKHAUTHUONGTRU.CO_HOKHAUTHUONGTRU_FK
;

DROP TABLE IF EXISTS CO_HOKHAUTHUONGTRU
;

DROP INDEX IF EXISTS CO_TAMTRU.CO_TAMTRU2_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_TAMTRU')
            and   name  = 'CO_TAMTRU_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_TAMTRU.CO_TAMTRU_FK
;

DROP TABLE IF EXISTS CO_TAMTRU
;

DROP INDEX IF EXISTS CO_TINHTRANGSK.CO_TINHTRANGSK2_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_TINHTRANGSK')
            and   name  = 'CO_TINHTRANGSK_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_TINHTRANGSK.CO_TINHTRANGSK_FK
;

DROP TABLE IF EXISTS CO_TINHTRANGSK
;

DROP INDEX IF EXISTS CO_TRDCM_CAONHAT.CO_TRINHDOCHUYENMONCAONHAT_FK
;

DROP TABLE IF EXISTS CO_TRDCM_CAONHAT
;

DROP INDEX IF EXISTS CO_TRD_NGOAINGU.CO_TRINHDONGOAINGU_FK
;

DROP TABLE IF EXISTS CO_TRD_NGOAINGU
;

DROP INDEX IF EXISTS CO_TRD_TINHOC.CO_TRINHDOTINHOC_FK
;

DROP TABLE IF EXISTS CO_TRD_TINHOC
;

DROP TABLE IF EXISTS DANHHIEU
;

DROP TABLE IF EXISTS DANTOC
;

DROP INDEX IF EXISTS DUOC_KHENTHUONG.DUOC_KHENTHUONG2_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('DUOC_KHENTHUONG')
            and   name  = 'DUOC_KHENTHUONG_FK'
            and   indid > 0
            and   indid < 255)
   drop index DUOC_KHENTHUONG.DUOC_KHENTHUONG_FK
;

DROP TABLE IF EXISTS DUOC_KHENTHUONG
;

DROP TABLE IF EXISTS HANGTHUONGBINH
;

DROP TABLE IF EXISTS HINHTHUCKHENTHUONG
;

DROP TABLE IF EXISTS HINHTHUCKYLUAT
;

DROP TABLE IF EXISTS HOCHAM
;

DROP TABLE IF EXISTS NGOAINGU
;

DROP TABLE IF EXISTS NHOMNGACH
;

DROP TABLE IF EXISTS QUANHAM
;

DROP TABLE IF EXISTS THONGTINQUANDOI
;

DROP INDEX IF EXISTS THUOC_NHOM_NGACH.THUOC_NHOM_NGACH2_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('THUOC_NHOM_NGACH')
            and   name  = 'THUOC_NHOM_NGACH_FK'
            and   indid > 0
            and   indid < 255)
   drop index THUOC_NHOM_NGACH.THUOC_NHOM_NGACH_FK
;

DROP TABLE IF EXISTS THUOC_NHOM_NGACH
;

DROP INDEX IF EXISTS THUOC_QUANDOI.THUOC_QUANDOI3_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('THUOC_QUANDOI')
            and   name  = 'THUOC_QUANDOI2_FK'
            and   indid > 0
            and   indid < 255)
   drop index THUOC_QUANDOI.THUOC_QUANDOI2_FK
;

DROP INDEX IF EXISTS THUOC_QUANDOI.THUOC_QUANDOI_FK
;

DROP TABLE IF EXISTS THUOC_QUANDOI
;

DROP INDEX IF EXISTS THUOC_TOCHUCDOANTHECHINHTRIXAHOI.THUOC_TOCHUCDOANTHECHINHTRIXAHOI2_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('THUOC_TOCHUCDOANTHECHINHTRIXAHOI')
            and   name  = 'THUOC_TOCHUCDOANTHECHINHTRIXAHOI_FK'
            and   indid > 0
            and   indid < 255)
   drop index THUOC_TOCHUCDOANTHECHINHTRIXAHOI.THUOC_TOCHUCDOANTHECHINHTRIXAHOI_FK
;

DROP TABLE IF EXISTS THUOC_TOCHUCDOANTHECHINHTRIXAHOI
;

DROP TABLE IF EXISTS TINHTHANH
;

DROP TABLE IF EXISTS TINHTRANGSUCKHOE
;

DROP TABLE IF EXISTS TOCHUCDOANTHECHINHTRIXAHOI
;

DROP TABLE IF EXISTS TONGIAO
;

DROP TABLE IF EXISTS TRINHDOHOCVAN
;

DROP INDEX IF EXISTS TUYENDUNG.TUYENDUNG3_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('TUYENDUNG')
            and   name  = 'TUYENDUNG2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TUYENDUNG.TUYENDUNG2_FK
;

DROP INDEX IF EXISTS TUYENDUNG.TUYENDUNG_FK
;

DROP TABLE IF EXISTS TUYENDUNG
;

DROP INDEX IF EXISTS VIENCHUC.CO_HANGTHUONGBINH_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'DUOCPHONG_DANHHIEU_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.DUOCPHONG_DANHHIEU_FK
;

DROP INDEX IF EXISTS VIENCHUC.DUOCPHONG_HOCHAM_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'CO_QUEQUAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.CO_QUEQUAN_FK
;

DROP INDEX IF EXISTS VIENCHUC.CO_NOISINH_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'CO_TONGIAO_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.CO_TONGIAO_FK
;

DROP INDEX IF EXISTS VIENCHUC.VIENCHUC_CO_DANTOC_FK
;

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'CO_TRINHDOHOCVAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.CO_TRINHDOHOCVAN_FK
;

DROP TABLE IF EXISTS VIENCHUC
;

DROP INDEX IF EXISTS XAPHUONG.TRUCTHUOC_FK
;

DROP TABLE IF EXISTS XAPHUONG
;

create table BACLUONG (
   MABACLUONG           char(5)              not null,
   constraint PK_BACLUONG primary key (MABACLUONG)
)
;

create table BI_KYLUAT (
   MAHINHTHUCKYLUAT     char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   NAMBIKYLUAT          datetime             null,
   SOQUYETDINHKYLUAT    char(50)             null,
   NGUOIKYQUYETDINHKYLUAT char(150)            null,
   constraint PK_BI_KYLUAT primary key (MAHINHTHUCKYLUAT, MAVIENCHUC)
)
;



CREATE INDEX BI_KYLUAT_FK on BI_KYLUAT (MAHINHTHUCKYLUAT ASC)
;



CREATE INDEX BI_KYLUAT2_FK on BI_KYLUAT (MAVIENCHUC ASC)
;

create table CAPLYLUANCHINHTRI (
   MACAPCT              char(5)              not null,
   TENCAPCT             varchar(30)          null,
   constraint PK_CAPLYLUANCHINHTRI primary key (MACAPCT)
)
;

create table CAPQUANLYNHANUOC (
   MACAPQLNN            char(5)              not null,
   TENCAPQLNN           varchar(30)          null,
   constraint PK_CAPQUANLYNHANUOC primary key (MACAPQLNN)
)
;

create table CHITIETLUONG (
   MACHITIETLUONG       char(5)              not null,
   constraint PK_CHITIETLUONG primary key (MACHITIETLUONG)
)
;

create table CHUCDANH_NGHENGHIEP (
   MANGHENGHIEP         char(5)              not null,
   TENNGHENGHIEP        varchar(30)          null,
   constraint PK_CHUCDANH_NGHENGHIEP primary key (MANGHENGHIEP)
)
;

create table CHUCVU (
   MACHUCVU             char(5)              not null,
   TENCHUCVU            char(30)             null,
   constraint PK_CHUCVU primary key (MACHUCVU)
)
;

create table CHUNGCHITINHOC (
   MACHUNGCHITINHOC     char(5)              not null,
   CHUNGCHITINHOC       varchar(30)          null,
   constraint PK_CHUNGCHITINHOC primary key (MACHUNGCHITINHOC)
)
;

create table CHUYENMON (
   MACHUYENMON          char(5)              not null,
   TENCHUYENMON         varchar(30)          null,
   constraint PK_CHUYENMON primary key (MACHUYENMON)
)
;

create table COQUAN (
   MACOQUAN             char(5)              not null,
   TENCOQUAN            varchar(30)          null,
   constraint PK_COQUAN primary key (MACOQUAN)
)
;

create table CO_CAPLYLUANCHINHTRI (
   MACAPCT              char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   constraint PK_CO_CAPLYLUANCHINHTRI primary key (MACAPCT, MAVIENCHUC)
)
;

CREATE INDEX CO_CAPLYLUANCHINHTRI_FK on CO_CAPLYLUANCHINHTRI (MACAPCT ASC)
;


CREATE INDEX CO_CAPLYLUANCHINHTRI2_FK on CO_CAPLYLUANCHINHTRI (MAVIENCHUC ASC)
;

create table CO_CAPQUANLYNHANUOC (
   MACAPQLNN            char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   constraint PK_CO_CAPQUANLYNHANUOC primary key (MACAPQLNN, MAVIENCHUC)
)
;


CREATE INDEX CO_CAPQUANLYNHANUOC_FK on CO_CAPQUANLYNHANUOC (MACAPQLNN ASC)
;


CREATE INDEX CO_CAPQUANLYNHANUOC2_FK on CO_CAPQUANLYNHANUOC (MAVIENCHUC ASC)
;

create table CO_CHUCVU (
   MAVIENCHUC           char(10)             not null,
   MACHUCVU             char(5)              not null,
   MACOQUAN             char(5)              not null,
   MANGHENGHIEP         char(5)              not null,
   THOIGIANGIUCHUCVU    datetime             null,
   THOIGIANKETTHUCCHUCVU datetime             null,
   constraint PK_CO_CHUCVU primary key (MAVIENCHUC, MACHUCVU, MACOQUAN, MANGHENGHIEP)
)
;


CREATE INDEX CO_CHUCVU_FK on CO_CHUCVU (MAVIENCHUC ASC)
;


CREATE INDEX CO_CHUCVU2_FK on CO_CHUCVU (MACHUCVU ASC)
;


CREATE INDEX CO_CHUCVU3_FK on CO_CHUCVU (MACOQUAN ASC)
;

CREATE INDEX CO_CHUCVU4_FK on CO_CHUCVU (MANGHENGHIEP ASC)
;
create table CO_HESOLUONG (
   MABACLUONG           char(5)              not null,
   MANHOMNGACH          char(4)              not null,
   MACHITIETLUONG       char(5)              not null,
   HESOLUONG            decimal(5,3)         null,
   constraint PK_CO_HESOLUONG primary key (MABACLUONG, MANHOMNGACH, MACHITIETLUONG)
)
;


CREATE INDEX CO_HESOLUONG_FK on CO_HESOLUONG (MABACLUONG ASC)
;

CREATE INDEX CO_HESOLUONG2_FK on CO_HESOLUONG (MANHOMNGACH ASC)
;


CREATE INDEX CO_HESOLUONG3_FK on CO_HESOLUONG (MACHITIETLUONG ASC)
;

create table CO_HOKHAUTHUONGTRU (
   MAVIENCHUC           char(10)             not null,
   MAXAPHUONG           char(5)              not null,
   THOIGIANDANGKYHOKHAU datetime             null,
   constraint PK_CO_HOKHAUTHUONGTRU primary key (MAVIENCHUC, MAXAPHUONG)
)
;


CREATE INDEX CO_HOKHAUTHUONGTRU_FK on CO_HOKHAUTHUONGTRU (MAVIENCHUC ASC)
;

CREATE INDEX CO_HOKHAUTHUONGTRU2_FK on CO_HOKHAUTHUONGTRU (MAXAPHUONG ASC)
;

create table CO_TAMTRU (
   MAVIENCHUC           char(10)             not null,
   MAXAPHUONG           char(5)              not null,
   THOIGIANDANGKYTAMTRU datetime             null,
   constraint PK_CO_TAMTRU primary key (MAVIENCHUC, MAXAPHUONG)
)
;


CREATE INDEX CO_TAMTRU_FK on CO_TAMTRU (MAVIENCHUC ASC)
;


CREATE INDEX CO_TAMTRU2_FK on CO_TAMTRU (MAXAPHUONG ASC)
;

create table CO_TINHTRANGSK (
   MAVIENCHUC           char(10)             not null,
   MASUCKHOE            char(5)              not null,
   CANNANG              decimal(4,2)         null,
   CHIEUCAO             TINYINT             null,
   THOIGIANGHINHAN      datetime             null,
   constraint PK_CO_TINHTRANGSK primary key (MAVIENCHUC, MASUCKHOE)
)
;


CREATE INDEX CO_TINHTRANGSK_FK on CO_TINHTRANGSK (MAVIENCHUC ASC)
;

CREATE INDEX CO_TINHTRANGSK2_FK on CO_TINHTRANGSK (MASUCKHOE ASC)
;

create table CO_TRDCM_CAONHAT (
   MACHUYENMON          char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   constraint PK_CO_TRDCM_CAONHAT primary key (MACHUYENMON, MAVIENCHUC)
)
;


CREATE INDEX CO_TRINHDOCHUYENMONCAONHAT_FK on CO_TRDCM_CAONHAT (MACHUYENMON ASC)
;

create table CO_TRD_NGOAINGU (
   MANGOAINGU           char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   constraint PK_CO_TRD_NGOAINGU primary key (MANGOAINGU, MAVIENCHUC)
)
;


CREATE INDEX CO_TRINHDONGOAINGU_FK on CO_TRD_NGOAINGU (MANGOAINGU ASC)
;

create table CO_TRD_TINHOC (
   MACHUNGCHITINHOC     char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   constraint PK_CO_TRD_TINHOC primary key (MACHUNGCHITINHOC, MAVIENCHUC)
)
;

CREATE INDEX CO_TRINHDOTINHOC_FK on CO_TRD_TINHOC (MACHUNGCHITINHOC ASC)
;
                   
create table DANHHIEU (
   MADANHHIEU           char(5)              not null,
   TENDANHHIEU          varchar(30)          null,
   constraint PK_DANHHIEU primary key (MADANHHIEU)
)
;

create table DANTOC (
   MADANTOC             char(5)              not null,
   TENDANTOC            varchar(30)          null,
   constraint PK_DANTOC primary key (MADANTOC)
)
;

create table DUOC_KHENTHUONG (
   MAHINHTHUCKHENTHUONG char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   NAMNHANKHENTHUONG    datetime             null,
   SOQUYETDINHKHENTHUONG char(50)             null,
   NGUOIKYQUYETDINHKHENTHUONG char(150)            null,
   constraint PK_DUOC_KHENTHUONG primary key (MAHINHTHUCKHENTHUONG, MAVIENCHUC)
)
;


CREATE INDEX DUOC_KHENTHUONG_FK on DUOC_KHENTHUONG (MAHINHTHUCKHENTHUONG ASC)
;


CREATE INDEX DUOC_KHENTHUONG2_FK on DUOC_KHENTHUONG (MAVIENCHUC ASC)
;

create table HANGTHUONGBINH (
   MAHANGTHUONGBINH     char(5)              not null,
   TENHANGTHUONGBINH    varchar(30)          null,
   constraint PK_HANGTHUONGBINH primary key (MAHANGTHUONGBINH)
)
;

create table HINHTHUCKHENTHUONG (
   MAHINHTHUCKHENTHUONG char(5)              not null,
   TENHINHTHUCKHENTHUONG varchar(30)          null,
   constraint PK_HINHTHUCKHENTHUONG primary key (MAHINHTHUCKHENTHUONG)
)
;

create table HINHTHUCKYLUAT (
   MAHINHTHUCKYLUAT     char(5)              not null,
   TENHINHTHUCKYLUAT    char(30)             null,
   constraint PK_HINHTHUCKYLUAT primary key (MAHINHTHUCKYLUAT)
)
;

create table HOCHAM (
   MAHOCHAM             char(5)              not null,
   TENHOCHAM            varchar(30)          null,
   constraint PK_HOCHAM primary key (MAHOCHAM)
)
;

create table NGOAINGU (
   MANGOAINGU           char(5)              not null,
   TENNGOAINGU          varchar(30)          null,
   CAPDO                char(5)              null,
   constraint PK_NGOAINGU primary key (MANGOAINGU)
)
;

create table NHOMNGACH (
   MANHOMNGACH          char(4)              not null,
   TENNHOMNGACH         char(30)             null,
   constraint PK_NHOMNGACH primary key (MANHOMNGACH)
)
;

create table QUANHAM (
   MAQUANHAM            char(5)              not null,
   TENQUANHAM           varchar(30)          null,
   constraint PK_QUANHAM primary key (MAQUANHAM)
)
;

create table THONGTINQUANDOI (
   MATTD_QD             char(5)              not null,
   constraint PK_THONGTINQUANDOI primary key (MATTD_QD)
)
;

create table THUOC_NHOM_NGACH (
   MAVIENCHUC           char(10)             not null,
   MACHITIETLUONG       char(5)              not null,
   THOIGIANBATDAUHUONG  datetime             null,
   constraint PK_THUOC_NHOM_NGACH primary key (MAVIENCHUC, MACHITIETLUONG)
)
;


CREATE INDEX THUOC_NHOM_NGACH_FK on THUOC_NHOM_NGACH (MAVIENCHUC ASC)
;


CREATE INDEX THUOC_NHOM_NGACH2_FK on THUOC_NHOM_NGACH (MACHITIETLUONG ASC)
;

create table THUOC_QUANDOI (
   MAVIENCHUC           char(10)             not null,
   MATTD_QD             char(5)              not null,
   MAQUANHAM            char(5)              not null,
   NGAYNHAPNGU          datetime             null,
   NGAYXUATNGU          datetime             null,
   NOINHAPNGU           text                 null,
   constraint PK_THUOC_QUANDOI primary key (MAVIENCHUC, MATTD_QD, MAQUANHAM)
)
;


CREATE INDEX THUOC_QUANDOI_FK on THUOC_QUANDOI (MAVIENCHUC ASC)
;


CREATE INDEX THUOC_QUANDOI2_FK on THUOC_QUANDOI (MATTD_QD ASC)
;


CREATE INDEX THUOC_QUANDOI3_FK on THUOC_QUANDOI (MAQUANHAM ASC)
;

create table THUOC_TOCHUCDOANTHECHINHTRIXAHOI (
   MAVIENCHUC           char(10)             not null,
   MATOCHUCDTCTXH       char(5)              not null,
   NGAYVAOTOCHUC        datetime             null,
   NGAYCHINHTHUC        datetime             null,
   NGUOIGIOITHIEU       text                 null,
   LANVAOTOCHUC         TINYINT             null,
   constraint PK_THUOC_TOCHUCDOANTHECHINHTRI primary key (MAVIENCHUC, MATOCHUCDTCTXH)
)
;



CREATE INDEX THUOC_TOCHUCDOANTHECHINHTRIXAHOI_FK on THUOC_TOCHUCDOANTHECHINHTRIXAHOI (MAVIENCHUC ASC)
;


CREATE INDEX THUOC_TOCHUCDOANTHECHINHTRIXAHOI2_FK on THUOC_TOCHUCDOANTHECHINHTRIXAHOI (MATOCHUCDTCTXH ASC)
;

create table TINHTHANH (
   MATINHTHANH          char(5)              not null,
   TENTINHTHANH         varchar(30)          null,
   constraint PK_TINHTHANH primary key (MATINHTHANH)
)
;
create table TINHTRANGSUCKHOE (
   MASUCKHOE            char(5)              not null,
   TINHTRANGSUCKHOE     varchar(20)          null,
   constraint PK_TINHTRANGSUCKHOE primary key (MASUCKHOE)
)
;

create table TOCHUCDOANTHECHINHTRIXAHOI (
   MATOCHUCDTCTXH       char(5)              not null,
   TENTOCHUCDTCTXH      text                 null,
   constraint PK_TOCHUCDOANTHECHINHTRIXAHOI primary key (MATOCHUCDTCTXH)
)
;

create table TONGIAO (
   MATONGIAO            char(5)              not null,
   TENTONGIAO           varchar(30)          null,
   constraint PK_TONGIAO primary key (MATONGIAO)
)
;

create table TRINHDOHOCVAN (
   MATRINHDO            char(5)              not null,
   TRINHDOGIAODUCPHOTHONG char(5)              null,
   TRINHDONGHIEPVUCHUYENNGANH varchar(100)         null,
   constraint PK_TRINHDOHOCVAN primary key (MATRINHDO)
)
;

create table TUYENDUNG (
   MANGHENGHIEP         char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   MACOQUAN             char(5)              not null,
   NGAYTUYENDUNG        datetime             null,
   constraint PK_TUYENDUNG primary key (MANGHENGHIEP, MAVIENCHUC, MACOQUAN)
)
;


CREATE INDEX TUYENDUNG_FK on TUYENDUNG (MANGHENGHIEP ASC)
;

CREATE INDEX TUYENDUNG2_FK on TUYENDUNG (MAVIENCHUC ASC)
;


CREATE INDEX TUYENDUNG3_FK on TUYENDUNG (MACOQUAN ASC)
;

create table VIENCHUC (
   MAVIENCHUC           char(10)             not null,
   MADANHHIEU           char(5)              null,
   MATONGIAO            char(5)              null,
   MAHOCHAM             char(5)              null,
   MATRINHDO            char(5)              not null,
   MADANTOC             char(5)              not null,
   MAHANGTHUONGBINH     char(5)              null,
   MAXAPHUONG           char(5)              not null, -- Viên chức có quê quán (FK_VIENCHUC_CO_QUEQUA_XAPHUONG)
   XAP_MAXAPHUONG       char(5)              not null, -- Viên chức có nơi sinh (FK_VIENCHUC_CO_NOISIN_XAPHUONG)
   HO                   varchar(20)          null,
   TENLOT               varchar(40)          null,
   TEN                  varchar(20)          null,
   TENKHAC              varchar(100)         null,
   NGAYSINH             datetime             null,
   GIOITINH             varchar(3)           null,
   NGAYTUYENDUNG        datetime             null,
   SOHIEUVIENCHUC       char(10)             null,
   ANHDAIDIEN           text                 null,
   SOCCCD               char(10)             null,
   NOICAPCCCD           char(100)            null,
   NGAYCAPCCCD          datetime             null,
   SOBAOHIEM            char(10)             null,
   NHOMMAU              char(3)              null,
   NAMDUOCPHONGHOCHAM   datetime             null,
   NAMDUOCPHONGDANHHIEU datetime             null,
   constraint PK_VIENCHUC primary key (MAVIENCHUC)
)
;


CREATE INDEX CO_TRINHDOHOCVAN_FK on VIENCHUC (MATRINHDO ASC)
;

CREATE INDEX VIENCHUC_CO_DANTOC_FK on VIENCHUC (MADANTOC ASC)
;


CREATE INDEX CO_TONGIAO_FK on VIENCHUC (MATONGIAO ASC)
;


CREATE INDEX CO_NOISINH_FK on VIENCHUC (XAP_MAXAPHUONG ASC)
;

CREATE INDEX CO_QUEQUAN_FK on VIENCHUC (MAXAPHUONG ASC)
;

CREATE INDEX DUOCPHONG_HOCHAM_FK on VIENCHUC (MAHOCHAM ASC)
;


CREATE INDEX DUOCPHONG_DANHHIEU_FK on VIENCHUC (MADANHHIEU ASC)
;


CREATE INDEX CO_HANGTHUONGBINH_FK on VIENCHUC (MAHANGTHUONGBINH ASC)
;

create table XAPHUONG (
   MAXAPHUONG           char(5)              not null,
   MATINHTHANH          char(5)              not null,
   TENXAPHUONG          varchar(30)          null,
   constraint PK_XAPHUONG primary key (MAXAPHUONG)
)
;

CREATE INDEX TRUCTHUOC_FK on XAPHUONG (MATINHTHANH ASC)
;

alter table BI_KYLUAT
   add constraint FK_BI_KYLUA_BI_KYLUAT_HINHTHUC foreign key (MAHINHTHUCKYLUAT)
      references HINHTHUCKYLUAT (MAHINHTHUCKYLUAT)
;

alter table BI_KYLUAT
   add constraint FK_BI_KYLUA_BI_KYLUAT_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table CO_CAPLYLUANCHINHTRI
   add constraint FK_CO_CAPLY_CO_CAPLYL_CAPLYLUA foreign key (MACAPCT)
      references CAPLYLUANCHINHTRI (MACAPCT)
;

alter table CO_CAPLYLUANCHINHTRI
   add constraint FK_CO_CAPLY_CO_CAPLYL_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table CO_CAPQUANLYNHANUOC
   add constraint FK_CO_CAPQU_CO_CAPQUA_CAPQUANL foreign key (MACAPQLNN)
      references CAPQUANLYNHANUOC (MACAPQLNN)
;

alter table CO_CAPQUANLYNHANUOC
   add constraint FK_CO_CAPQU_CO_CAPQUA_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table CO_CHUCVU
   add constraint FK_CO_CHUCV_CO_CHUCVU_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table CO_CHUCVU
   add constraint FK_CO_CHUCV_CO_CHUCVU_CHUCVU foreign key (MACHUCVU)
      references CHUCVU (MACHUCVU)
;

alter table CO_CHUCVU
   add constraint FK_CO_CHUCV_CO_CHUCVU_COQUAN foreign key (MACOQUAN)
      references COQUAN (MACOQUAN)
;

alter table CO_CHUCVU
   add constraint FK_CO_CHUCV_CO_CHUCVU_CHUCDANH foreign key (MANGHENGHIEP)
      references CHUCDANH_NGHENGHIEP (MANGHENGHIEP)
;

alter table CO_HESOLUONG
   add constraint FK_CO_HESOL_CO_HESOLU_BACLUONG foreign key (MABACLUONG)
      references BACLUONG (MABACLUONG)
;

alter table CO_HESOLUONG
   add constraint FK_CO_HESOL_CO_HESOLU_NHOMNGAC foreign key (MANHOMNGACH)
      references NHOMNGACH (MANHOMNGACH)
;

alter table CO_HESOLUONG
   add constraint FK_CO_HESOL_CO_HESOLU_CHITIETL foreign key (MACHITIETLUONG)
      references CHITIETLUONG (MACHITIETLUONG)
;

alter table CO_HOKHAUTHUONGTRU
   add constraint FK_CO_HOKHA_CO_HOKHAU_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table CO_HOKHAUTHUONGTRU
   add constraint FK_CO_HOKHA_CO_HOKHAU_XAPHUONG foreign key (MAXAPHUONG)
      references XAPHUONG (MAXAPHUONG)
;

alter table CO_TAMTRU
   add constraint FK_CO_TAMTR_CO_TAMTRU_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table CO_TAMTRU
   add constraint FK_CO_TAMTR_CO_TAMTRU_XAPHUONG foreign key (MAXAPHUONG)
      references XAPHUONG (MAXAPHUONG)
;

alter table CO_TINHTRANGSK
   add constraint FK_CO_TINHT_CO_TINHTR_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table CO_TINHTRANGSK
   add constraint FK_CO_TINHT_CO_TINHTR_TINHTRAN foreign key (MASUCKHOE)
      references TINHTRANGSUCKHOE (MASUCKHOE)
;

alter table CO_TRDCM_CAONHAT
   add constraint FK_CO_TRDCM_CO_TRDCM__CHUYENMO foreign key (MACHUYENMON)
      references CHUYENMON (MACHUYENMON)
;

alter table CO_TRDCM_CAONHAT
   add constraint FK_CO_TRDCM_CO_TRDCM__VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table CO_TRD_NGOAINGU
   add constraint FK_CO_TRD_N_CO_TRD_NG_NGOAINGU foreign key (MANGOAINGU)
      references NGOAINGU (MANGOAINGU)
;

alter table CO_TRD_NGOAINGU
   add constraint FK_CO_TRD_N_CO_TRD_NG_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table CO_TRD_TINHOC
   add constraint FK_CO_TRD_T_CO_TRD_TI_CHUNGCHI foreign key (MACHUNGCHITINHOC)
      references CHUNGCHITINHOC (MACHUNGCHITINHOC)
;

alter table CO_TRD_TINHOC
   add constraint FK_CO_TRD_T_CO_TRD_TI_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table DUOC_KHENTHUONG
   add constraint FK_DUOC_KHE_DUOC_KHEN_HINHTHUC foreign key (MAHINHTHUCKHENTHUONG)
      references HINHTHUCKHENTHUONG (MAHINHTHUCKHENTHUONG)
;

alter table DUOC_KHENTHUONG
   add constraint FK_DUOC_KHE_DUOC_KHEN_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table THUOC_NHOM_NGACH
   add constraint FK_THUOC_NH_THUOC_NHO_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table THUOC_NHOM_NGACH
   add constraint FK_THUOC_NH_THUOC_NHO_CHITIETL foreign key (MACHITIETLUONG)
      references CHITIETLUONG (MACHITIETLUONG)
;

alter table THUOC_QUANDOI
   add constraint FK_THUOC_QU_THUOC_QUA_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table THUOC_QUANDOI
   add constraint FK_THUOC_QU_THUOC_QUA_THONGTIN foreign key (MATTD_QD)
      references THONGTINQUANDOI (MATTD_QD)
;

alter table THUOC_QUANDOI
   add constraint FK_THUOC_QU_THUOC_QUA_QUANHAM foreign key (MAQUANHAM)
      references QUANHAM (MAQUANHAM)
;

alter table THUOC_TOCHUCDOANTHECHINHTRIXAHOI
   add constraint FK_THUOC_TO_THUOC_TOC_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table THUOC_TOCHUCDOANTHECHINHTRIXAHOI
   add constraint FK_THUOC_TO_THUOC_TOC_TOCHUCDO foreign key (MATOCHUCDTCTXH)
      references TOCHUCDOANTHECHINHTRIXAHOI (MATOCHUCDTCTXH)
;

alter table TUYENDUNG
   add constraint FK_TUYENDUN_TUYENDUNG_CHUCDANH foreign key (MANGHENGHIEP)
      references CHUCDANH_NGHENGHIEP (MANGHENGHIEP)
;

alter table TUYENDUNG
   add constraint FK_TUYENDUN_TUYENDUNG_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
;

alter table TUYENDUNG
   add constraint FK_TUYENDUN_TUYENDUNG_COQUAN foreign key (MACOQUAN)
      references COQUAN (MACOQUAN)
;

alter table VIENCHUC
   add constraint FK_VIENCHUC_CO_HANGTH_HANGTHUO foreign key (MAHANGTHUONGBINH)
      references HANGTHUONGBINH (MAHANGTHUONGBINH)
;

alter table VIENCHUC
   add constraint FK_VIENCHUC_CO_NOISIN_XAPHUONG foreign key (XAP_MAXAPHUONG)
      references XAPHUONG (MAXAPHUONG)
;

alter table VIENCHUC
   add constraint FK_VIENCHUC_CO_QUEQUA_XAPHUONG foreign key (MAXAPHUONG)
      references XAPHUONG (MAXAPHUONG)
;

alter table VIENCHUC
   add constraint FK_VIENCHUC_CO_TONGIA_TONGIAO foreign key (MATONGIAO)
      references TONGIAO (MATONGIAO)
;

alter table VIENCHUC
   add constraint FK_VIENCHUC_CO_TRINHD_TRINHDOH foreign key (MATRINHDO)
      references TRINHDOHOCVAN (MATRINHDO)
;

alter table VIENCHUC
   add constraint FK_VIENCHUC_DUOCPHONG_DANHHIEU foreign key (MADANHHIEU)
      references DANHHIEU (MADANHHIEU)
;

alter table VIENCHUC
   add constraint FK_VIENCHUC_DUOCPHONG_HOCHAM foreign key (MAHOCHAM)
      references HOCHAM (MAHOCHAM)
;

alter table VIENCHUC
   add constraint FK_VIENCHUC_VIENCHUC__DANTOC foreign key (MADANTOC)
      references DANTOC (MADANTOC)
;

alter table XAPHUONG
   add constraint FK_XAPHUONG_TRUCTHUOC_TINHTHAN foreign key (MATINHTHANH)
      references TINHTHANH (MATINHTHANH)
;