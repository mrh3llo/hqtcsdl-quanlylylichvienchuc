/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     22/05/2026 15:33:05                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BI_KYLUAT') and o.name = 'FK_BI_KYLUA_BI_KYLUAT_HINHTHUC')
alter table BI_KYLUAT
   drop constraint FK_BI_KYLUA_BI_KYLUAT_HINHTHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BI_KYLUAT') and o.name = 'FK_BI_KYLUA_BI_KYLUAT_VIENCHUC')
alter table BI_KYLUAT
   drop constraint FK_BI_KYLUA_BI_KYLUAT_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_CAPLYLUANCHINHTRI') and o.name = 'FK_CO_CAPLY_CO_CAPLYL_CAPLYLUA')
alter table CO_CAPLYLUANCHINHTRI
   drop constraint FK_CO_CAPLY_CO_CAPLYL_CAPLYLUA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_CAPLYLUANCHINHTRI') and o.name = 'FK_CO_CAPLY_CO_CAPLYL_VIENCHUC')
alter table CO_CAPLYLUANCHINHTRI
   drop constraint FK_CO_CAPLY_CO_CAPLYL_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_CAPQUANLYNHANUOC') and o.name = 'FK_CO_CAPQU_CO_CAPQUA_CAPQUANL')
alter table CO_CAPQUANLYNHANUOC
   drop constraint FK_CO_CAPQU_CO_CAPQUA_CAPQUANL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_CAPQUANLYNHANUOC') and o.name = 'FK_CO_CAPQU_CO_CAPQUA_VIENCHUC')
alter table CO_CAPQUANLYNHANUOC
   drop constraint FK_CO_CAPQU_CO_CAPQUA_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_CHUCVU') and o.name = 'FK_CO_CHUCV_CO_CHUCVU_VIENCHUC')
alter table CO_CHUCVU
   drop constraint FK_CO_CHUCV_CO_CHUCVU_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_CHUCVU') and o.name = 'FK_CO_CHUCV_CO_CHUCVU_CHUCVU')
alter table CO_CHUCVU
   drop constraint FK_CO_CHUCV_CO_CHUCVU_CHUCVU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_CHUCVU') and o.name = 'FK_CO_CHUCV_CO_CHUCVU_COQUAN')
alter table CO_CHUCVU
   drop constraint FK_CO_CHUCV_CO_CHUCVU_COQUAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_CHUCVU') and o.name = 'FK_CO_CHUCV_CO_CHUCVU_CHUCDANH')
alter table CO_CHUCVU
   drop constraint FK_CO_CHUCV_CO_CHUCVU_CHUCDANH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_HESOLUONG') and o.name = 'FK_CO_HESOL_CO_HESOLU_BACLUONG')
alter table CO_HESOLUONG
   drop constraint FK_CO_HESOL_CO_HESOLU_BACLUONG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_HESOLUONG') and o.name = 'FK_CO_HESOL_CO_HESOLU_NHOMNGAC')
alter table CO_HESOLUONG
   drop constraint FK_CO_HESOL_CO_HESOLU_NHOMNGAC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_HESOLUONG') and o.name = 'FK_CO_HESOL_CO_HESOLU_CHITIETL')
alter table CO_HESOLUONG
   drop constraint FK_CO_HESOL_CO_HESOLU_CHITIETL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_HOKHAUTHUONGTRU') and o.name = 'FK_CO_HOKHA_CO_HOKHAU_VIENCHUC')
alter table CO_HOKHAUTHUONGTRU
   drop constraint FK_CO_HOKHA_CO_HOKHAU_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_HOKHAUTHUONGTRU') and o.name = 'FK_CO_HOKHA_CO_HOKHAU_XAPHUONG')
alter table CO_HOKHAUTHUONGTRU
   drop constraint FK_CO_HOKHA_CO_HOKHAU_XAPHUONG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_TAMTRU') and o.name = 'FK_CO_TAMTR_CO_TAMTRU_VIENCHUC')
alter table CO_TAMTRU
   drop constraint FK_CO_TAMTR_CO_TAMTRU_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_TAMTRU') and o.name = 'FK_CO_TAMTR_CO_TAMTRU_XAPHUONG')
alter table CO_TAMTRU
   drop constraint FK_CO_TAMTR_CO_TAMTRU_XAPHUONG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_TINHTRANGSK') and o.name = 'FK_CO_TINHT_CO_TINHTR_VIENCHUC')
alter table CO_TINHTRANGSK
   drop constraint FK_CO_TINHT_CO_TINHTR_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_TINHTRANGSK') and o.name = 'FK_CO_TINHT_CO_TINHTR_TINHTRAN')
alter table CO_TINHTRANGSK
   drop constraint FK_CO_TINHT_CO_TINHTR_TINHTRAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_TRDCM_CAONHAT') and o.name = 'FK_CO_TRDCM_CO_TRDCM__CHUYENMO')
alter table CO_TRDCM_CAONHAT
   drop constraint FK_CO_TRDCM_CO_TRDCM__CHUYENMO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_TRDCM_CAONHAT') and o.name = 'FK_CO_TRDCM_CO_TRDCM__VIENCHUC')
alter table CO_TRDCM_CAONHAT
   drop constraint FK_CO_TRDCM_CO_TRDCM__VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_TRD_NGOAINGU') and o.name = 'FK_CO_TRD_N_CO_TRD_NG_NGOAINGU')
alter table CO_TRD_NGOAINGU
   drop constraint FK_CO_TRD_N_CO_TRD_NG_NGOAINGU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_TRD_NGOAINGU') and o.name = 'FK_CO_TRD_N_CO_TRD_NG_VIENCHUC')
alter table CO_TRD_NGOAINGU
   drop constraint FK_CO_TRD_N_CO_TRD_NG_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_TRD_TINHOC') and o.name = 'FK_CO_TRD_T_CO_TRD_TI_CHUNGCHI')
alter table CO_TRD_TINHOC
   drop constraint FK_CO_TRD_T_CO_TRD_TI_CHUNGCHI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CO_TRD_TINHOC') and o.name = 'FK_CO_TRD_T_CO_TRD_TI_VIENCHUC')
alter table CO_TRD_TINHOC
   drop constraint FK_CO_TRD_T_CO_TRD_TI_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DUOC_KHENTHUONG') and o.name = 'FK_DUOC_KHE_DUOC_KHEN_HINHTHUC')
alter table DUOC_KHENTHUONG
   drop constraint FK_DUOC_KHE_DUOC_KHEN_HINHTHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DUOC_KHENTHUONG') and o.name = 'FK_DUOC_KHE_DUOC_KHEN_VIENCHUC')
alter table DUOC_KHENTHUONG
   drop constraint FK_DUOC_KHE_DUOC_KHEN_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('THUOC_NHOM_NGACH') and o.name = 'FK_THUOC_NH_THUOC_NHO_VIENCHUC')
alter table THUOC_NHOM_NGACH
   drop constraint FK_THUOC_NH_THUOC_NHO_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('THUOC_NHOM_NGACH') and o.name = 'FK_THUOC_NH_THUOC_NHO_CHITIETL')
alter table THUOC_NHOM_NGACH
   drop constraint FK_THUOC_NH_THUOC_NHO_CHITIETL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('THUOC_QUANDOI') and o.name = 'FK_THUOC_QU_THUOC_QUA_VIENCHUC')
alter table THUOC_QUANDOI
   drop constraint FK_THUOC_QU_THUOC_QUA_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('THUOC_QUANDOI') and o.name = 'FK_THUOC_QU_THUOC_QUA_THONGTIN')
alter table THUOC_QUANDOI
   drop constraint FK_THUOC_QU_THUOC_QUA_THONGTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('THUOC_QUANDOI') and o.name = 'FK_THUOC_QU_THUOC_QUA_QUANHAM')
alter table THUOC_QUANDOI
   drop constraint FK_THUOC_QU_THUOC_QUA_QUANHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('THUOC_TOCHUCDOANTHECHINHTRIXAHOI') and o.name = 'FK_THUOC_TO_THUOC_TOC_VIENCHUC')
alter table THUOC_TOCHUCDOANTHECHINHTRIXAHOI
   drop constraint FK_THUOC_TO_THUOC_TOC_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('THUOC_TOCHUCDOANTHECHINHTRIXAHOI') and o.name = 'FK_THUOC_TO_THUOC_TOC_TOCHUCDO')
alter table THUOC_TOCHUCDOANTHECHINHTRIXAHOI
   drop constraint FK_THUOC_TO_THUOC_TOC_TOCHUCDO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TUYENDUNG') and o.name = 'FK_TUYENDUN_TUYENDUNG_CHUCDANH')
alter table TUYENDUNG
   drop constraint FK_TUYENDUN_TUYENDUNG_CHUCDANH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TUYENDUNG') and o.name = 'FK_TUYENDUN_TUYENDUNG_VIENCHUC')
alter table TUYENDUNG
   drop constraint FK_TUYENDUN_TUYENDUNG_VIENCHUC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TUYENDUNG') and o.name = 'FK_TUYENDUN_TUYENDUNG_COQUAN')
alter table TUYENDUNG
   drop constraint FK_TUYENDUN_TUYENDUNG_COQUAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIENCHUC') and o.name = 'FK_VIENCHUC_CO_HANGTH_HANGTHUO')
alter table VIENCHUC
   drop constraint FK_VIENCHUC_CO_HANGTH_HANGTHUO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIENCHUC') and o.name = 'FK_VIENCHUC_CO_NOISIN_XAPHUONG')
alter table VIENCHUC
   drop constraint FK_VIENCHUC_CO_NOISIN_XAPHUONG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIENCHUC') and o.name = 'FK_VIENCHUC_CO_QUEQUA_XAPHUONG')
alter table VIENCHUC
   drop constraint FK_VIENCHUC_CO_QUEQUA_XAPHUONG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIENCHUC') and o.name = 'FK_VIENCHUC_CO_TONGIA_TONGIAO')
alter table VIENCHUC
   drop constraint FK_VIENCHUC_CO_TONGIA_TONGIAO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIENCHUC') and o.name = 'FK_VIENCHUC_CO_TRINHD_TRINHDOH')
alter table VIENCHUC
   drop constraint FK_VIENCHUC_CO_TRINHD_TRINHDOH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIENCHUC') and o.name = 'FK_VIENCHUC_DUOCPHONG_DANHHIEU')
alter table VIENCHUC
   drop constraint FK_VIENCHUC_DUOCPHONG_DANHHIEU
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIENCHUC') and o.name = 'FK_VIENCHUC_DUOCPHONG_HOCHAM')
alter table VIENCHUC
   drop constraint FK_VIENCHUC_DUOCPHONG_HOCHAM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VIENCHUC') and o.name = 'FK_VIENCHUC_VIENCHUC__DANTOC')
alter table VIENCHUC
   drop constraint FK_VIENCHUC_VIENCHUC__DANTOC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('XAPHUONG') and o.name = 'FK_XAPHUONG_TRUCTHUOC_TINHTHAN')
alter table XAPHUONG
   drop constraint FK_XAPHUONG_TRUCTHUOC_TINHTHAN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BACLUONG')
            and   type = 'U')
   drop table BACLUONG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BI_KYLUAT')
            and   name  = 'BI_KYLUAT2_FK'
            and   indid > 0
            and   indid < 255)
   drop index BI_KYLUAT.BI_KYLUAT2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BI_KYLUAT')
            and   name  = 'BI_KYLUAT_FK'
            and   indid > 0
            and   indid < 255)
   drop index BI_KYLUAT.BI_KYLUAT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BI_KYLUAT')
            and   type = 'U')
   drop table BI_KYLUAT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CAPLYLUANCHINHTRI')
            and   type = 'U')
   drop table CAPLYLUANCHINHTRI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CAPQUANLYNHANUOC')
            and   type = 'U')
   drop table CAPQUANLYNHANUOC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHITIETLUONG')
            and   type = 'U')
   drop table CHITIETLUONG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHUCDANH_NGHENGHIEP')
            and   type = 'U')
   drop table CHUCDANH_NGHENGHIEP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHUCVU')
            and   type = 'U')
   drop table CHUCVU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHUNGCHITINHOC')
            and   type = 'U')
   drop table CHUNGCHITINHOC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHUYENMON')
            and   type = 'U')
   drop table CHUYENMON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COQUAN')
            and   type = 'U')
   drop table COQUAN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CAPLYLUANCHINHTRI')
            and   name  = 'CO_CAPLYLUANCHINHTRI2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CAPLYLUANCHINHTRI.CO_CAPLYLUANCHINHTRI2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CAPLYLUANCHINHTRI')
            and   name  = 'CO_CAPLYLUANCHINHTRI_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CAPLYLUANCHINHTRI.CO_CAPLYLUANCHINHTRI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO_CAPLYLUANCHINHTRI')
            and   type = 'U')
   drop table CO_CAPLYLUANCHINHTRI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CAPQUANLYNHANUOC')
            and   name  = 'CO_CAPQUANLYNHANUOC2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CAPQUANLYNHANUOC.CO_CAPQUANLYNHANUOC2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CAPQUANLYNHANUOC')
            and   name  = 'CO_CAPQUANLYNHANUOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CAPQUANLYNHANUOC.CO_CAPQUANLYNHANUOC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO_CAPQUANLYNHANUOC')
            and   type = 'U')
   drop table CO_CAPQUANLYNHANUOC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CHUCVU')
            and   name  = 'CO_CHUCVU4_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CHUCVU.CO_CHUCVU4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CHUCVU')
            and   name  = 'CO_CHUCVU3_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CHUCVU.CO_CHUCVU3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CHUCVU')
            and   name  = 'CO_CHUCVU2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CHUCVU.CO_CHUCVU2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_CHUCVU')
            and   name  = 'CO_CHUCVU_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_CHUCVU.CO_CHUCVU_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO_CHUCVU')
            and   type = 'U')
   drop table CO_CHUCVU
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_HESOLUONG')
            and   name  = 'CO_HESOLUONG3_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_HESOLUONG.CO_HESOLUONG3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_HESOLUONG')
            and   name  = 'CO_HESOLUONG2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_HESOLUONG.CO_HESOLUONG2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_HESOLUONG')
            and   name  = 'CO_HESOLUONG_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_HESOLUONG.CO_HESOLUONG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO_HESOLUONG')
            and   type = 'U')
   drop table CO_HESOLUONG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_HOKHAUTHUONGTRU')
            and   name  = 'CO_HOKHAUTHUONGTRU2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_HOKHAUTHUONGTRU.CO_HOKHAUTHUONGTRU2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_HOKHAUTHUONGTRU')
            and   name  = 'CO_HOKHAUTHUONGTRU_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_HOKHAUTHUONGTRU.CO_HOKHAUTHUONGTRU_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO_HOKHAUTHUONGTRU')
            and   type = 'U')
   drop table CO_HOKHAUTHUONGTRU
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_TAMTRU')
            and   name  = 'CO_TAMTRU2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_TAMTRU.CO_TAMTRU2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_TAMTRU')
            and   name  = 'CO_TAMTRU_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_TAMTRU.CO_TAMTRU_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO_TAMTRU')
            and   type = 'U')
   drop table CO_TAMTRU
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_TINHTRANGSK')
            and   name  = 'CO_TINHTRANGSK2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_TINHTRANGSK.CO_TINHTRANGSK2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_TINHTRANGSK')
            and   name  = 'CO_TINHTRANGSK_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_TINHTRANGSK.CO_TINHTRANGSK_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO_TINHTRANGSK')
            and   type = 'U')
   drop table CO_TINHTRANGSK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_TRDCM_CAONHAT')
            and   name  = 'CO_TRINHDOCHUYENMONCAONHAT_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_TRDCM_CAONHAT.CO_TRINHDOCHUYENMONCAONHAT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO_TRDCM_CAONHAT')
            and   type = 'U')
   drop table CO_TRDCM_CAONHAT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_TRD_NGOAINGU')
            and   name  = 'CO_TRINHDONGOAINGU_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_TRD_NGOAINGU.CO_TRINHDONGOAINGU_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO_TRD_NGOAINGU')
            and   type = 'U')
   drop table CO_TRD_NGOAINGU
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CO_TRD_TINHOC')
            and   name  = 'CO_TRINHDOTINHOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index CO_TRD_TINHOC.CO_TRINHDOTINHOC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CO_TRD_TINHOC')
            and   type = 'U')
   drop table CO_TRD_TINHOC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DANHHIEU')
            and   type = 'U')
   drop table DANHHIEU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DANTOC')
            and   type = 'U')
   drop table DANTOC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DUOC_KHENTHUONG')
            and   name  = 'DUOC_KHENTHUONG2_FK'
            and   indid > 0
            and   indid < 255)
   drop index DUOC_KHENTHUONG.DUOC_KHENTHUONG2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DUOC_KHENTHUONG')
            and   name  = 'DUOC_KHENTHUONG_FK'
            and   indid > 0
            and   indid < 255)
   drop index DUOC_KHENTHUONG.DUOC_KHENTHUONG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DUOC_KHENTHUONG')
            and   type = 'U')
   drop table DUOC_KHENTHUONG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HANGTHUONGBINH')
            and   type = 'U')
   drop table HANGTHUONGBINH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HINHTHUCKHENTHUONG')
            and   type = 'U')
   drop table HINHTHUCKHENTHUONG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HINHTHUCKYLUAT')
            and   type = 'U')
   drop table HINHTHUCKYLUAT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HOCHAM')
            and   type = 'U')
   drop table HOCHAM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NGOAINGU')
            and   type = 'U')
   drop table NGOAINGU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHOMNGACH')
            and   type = 'U')
   drop table NHOMNGACH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('QUANHAM')
            and   type = 'U')
   drop table QUANHAM
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THONGTINQUANDOI')
            and   type = 'U')
   drop table THONGTINQUANDOI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('THUOC_NHOM_NGACH')
            and   name  = 'THUOC_NHOM_NGACH2_FK'
            and   indid > 0
            and   indid < 255)
   drop index THUOC_NHOM_NGACH.THUOC_NHOM_NGACH2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('THUOC_NHOM_NGACH')
            and   name  = 'THUOC_NHOM_NGACH_FK'
            and   indid > 0
            and   indid < 255)
   drop index THUOC_NHOM_NGACH.THUOC_NHOM_NGACH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THUOC_NHOM_NGACH')
            and   type = 'U')
   drop table THUOC_NHOM_NGACH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('THUOC_QUANDOI')
            and   name  = 'THUOC_QUANDOI3_FK'
            and   indid > 0
            and   indid < 255)
   drop index THUOC_QUANDOI.THUOC_QUANDOI3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('THUOC_QUANDOI')
            and   name  = 'THUOC_QUANDOI2_FK'
            and   indid > 0
            and   indid < 255)
   drop index THUOC_QUANDOI.THUOC_QUANDOI2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('THUOC_QUANDOI')
            and   name  = 'THUOC_QUANDOI_FK'
            and   indid > 0
            and   indid < 255)
   drop index THUOC_QUANDOI.THUOC_QUANDOI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THUOC_QUANDOI')
            and   type = 'U')
   drop table THUOC_QUANDOI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('THUOC_TOCHUCDOANTHECHINHTRIXAHOI')
            and   name  = 'THUOC_TOCHUCDOANTHECHINHTRIXAHOI2_FK'
            and   indid > 0
            and   indid < 255)
   drop index THUOC_TOCHUCDOANTHECHINHTRIXAHOI.THUOC_TOCHUCDOANTHECHINHTRIXAHOI2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('THUOC_TOCHUCDOANTHECHINHTRIXAHOI')
            and   name  = 'THUOC_TOCHUCDOANTHECHINHTRIXAHOI_FK'
            and   indid > 0
            and   indid < 255)
   drop index THUOC_TOCHUCDOANTHECHINHTRIXAHOI.THUOC_TOCHUCDOANTHECHINHTRIXAHOI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THUOC_TOCHUCDOANTHECHINHTRIXAHOI')
            and   type = 'U')
   drop table THUOC_TOCHUCDOANTHECHINHTRIXAHOI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TINHTHANH')
            and   type = 'U')
   drop table TINHTHANH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TINHTRANGSUCKHOE')
            and   type = 'U')
   drop table TINHTRANGSUCKHOE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TOCHUCDOANTHECHINHTRIXAHOI')
            and   type = 'U')
   drop table TOCHUCDOANTHECHINHTRIXAHOI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TONGIAO')
            and   type = 'U')
   drop table TONGIAO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRINHDOHOCVAN')
            and   type = 'U')
   drop table TRINHDOHOCVAN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TUYENDUNG')
            and   name  = 'TUYENDUNG3_FK'
            and   indid > 0
            and   indid < 255)
   drop index TUYENDUNG.TUYENDUNG3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TUYENDUNG')
            and   name  = 'TUYENDUNG2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TUYENDUNG.TUYENDUNG2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TUYENDUNG')
            and   name  = 'TUYENDUNG_FK'
            and   indid > 0
            and   indid < 255)
   drop index TUYENDUNG.TUYENDUNG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TUYENDUNG')
            and   type = 'U')
   drop table TUYENDUNG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'CO_HANGTHUONGBINH_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.CO_HANGTHUONGBINH_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'DUOCPHONG_DANHHIEU_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.DUOCPHONG_DANHHIEU_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'DUOCPHONG_HOCHAM_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.DUOCPHONG_HOCHAM_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'CO_QUEQUAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.CO_QUEQUAN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'CO_NOISINH_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.CO_NOISINH_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'CO_TONGIAO_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.CO_TONGIAO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'VIENCHUC_CO_DANTOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.VIENCHUC_CO_DANTOC_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VIENCHUC')
            and   name  = 'CO_TRINHDOHOCVAN_FK'
            and   indid > 0
            and   indid < 255)
   drop index VIENCHUC.CO_TRINHDOHOCVAN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VIENCHUC')
            and   type = 'U')
   drop table VIENCHUC
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('XAPHUONG')
            and   name  = 'TRUCTHUOC_FK'
            and   indid > 0
            and   indid < 255)
   drop index XAPHUONG.TRUCTHUOC_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('XAPHUONG')
            and   type = 'U')
   drop table XAPHUONG
go

/*==============================================================*/
/* Table: BACLUONG                                              */
/*==============================================================*/
create table BACLUONG (
   MABACLUONG           char(5)              not null,
   constraint PK_BACLUONG primary key (MABACLUONG)
)
go

/*==============================================================*/
/* Table: BI_KYLUAT                                             */
/*==============================================================*/
create table BI_KYLUAT (
   MAHINHTHUCKYLUAT     char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   NAMBIKYLUAT          datetime             null,
   SOQUYETDINHKYLUAT    char(50)             null,
   NGUOIKYQUYETDINHKYLUAT char(150)            null,
   constraint PK_BI_KYLUAT primary key (MAHINHTHUCKYLUAT, MAVIENCHUC)
)
go

/*==============================================================*/
/* Index: BI_KYLUAT_FK                                          */
/*==============================================================*/




create nonclustered index BI_KYLUAT_FK on BI_KYLUAT (MAHINHTHUCKYLUAT ASC)
go

/*==============================================================*/
/* Index: BI_KYLUAT2_FK                                         */
/*==============================================================*/




create nonclustered index BI_KYLUAT2_FK on BI_KYLUAT (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Table: CAPLYLUANCHINHTRI                                     */
/*==============================================================*/
create table CAPLYLUANCHINHTRI (
   MACAPCT              char(5)              not null,
   TENCAPCT             varchar(30)          null,
   constraint PK_CAPLYLUANCHINHTRI primary key (MACAPCT)
)
go

/*==============================================================*/
/* Table: CAPQUANLYNHANUOC                                      */
/*==============================================================*/
create table CAPQUANLYNHANUOC (
   MACAPQLNN            char(5)              not null,
   TENCAPQLNN           varchar(30)          null,
   constraint PK_CAPQUANLYNHANUOC primary key (MACAPQLNN)
)
go

/*==============================================================*/
/* Table: CHITIETLUONG                                          */
/*==============================================================*/
create table CHITIETLUONG (
   MACHITIETLUONG       char(5)              not null,
   constraint PK_CHITIETLUONG primary key (MACHITIETLUONG)
)
go

/*==============================================================*/
/* Table: CHUCDANH_NGHENGHIEP                                   */
/*==============================================================*/
create table CHUCDANH_NGHENGHIEP (
   MANGHENGHIEP         char(5)              not null,
   TENNGHENGHIEP        varchar(30)          null,
   constraint PK_CHUCDANH_NGHENGHIEP primary key (MANGHENGHIEP)
)
go

/*==============================================================*/
/* Table: CHUCVU                                                */
/*==============================================================*/
create table CHUCVU (
   MACHUCVU             char(5)              not null,
   TENCHUCVU            char(30)             null,
   constraint PK_CHUCVU primary key (MACHUCVU)
)
go

/*==============================================================*/
/* Table: CHUNGCHITINHOC                                        */
/*==============================================================*/
create table CHUNGCHITINHOC (
   MACHUNGCHITINHOC     char(5)              not null,
   CHUNGCHITINHOC       varchar(30)          null,
   constraint PK_CHUNGCHITINHOC primary key (MACHUNGCHITINHOC)
)
go

/*==============================================================*/
/* Table: CHUYENMON                                             */
/*==============================================================*/
create table CHUYENMON (
   MACHUYENMON          char(5)              not null,
   TENCHUYENMON         varchar(30)          null,
   constraint PK_CHUYENMON primary key (MACHUYENMON)
)
go

/*==============================================================*/
/* Table: COQUAN                                                */
/*==============================================================*/
create table COQUAN (
   MACOQUAN             char(5)              not null,
   TENCOQUAN            varchar(30)          null,
   constraint PK_COQUAN primary key (MACOQUAN)
)
go

/*==============================================================*/
/* Table: CO_CAPLYLUANCHINHTRI                                  */
/*==============================================================*/
create table CO_CAPLYLUANCHINHTRI (
   MACAPCT              char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   constraint PK_CO_CAPLYLUANCHINHTRI primary key (MACAPCT, MAVIENCHUC)
)
go

/*==============================================================*/
/* Index: CO_CAPLYLUANCHINHTRI_FK                               */
/*==============================================================*/




create nonclustered index CO_CAPLYLUANCHINHTRI_FK on CO_CAPLYLUANCHINHTRI (MACAPCT ASC)
go

/*==============================================================*/
/* Index: CO_CAPLYLUANCHINHTRI2_FK                              */
/*==============================================================*/




create nonclustered index CO_CAPLYLUANCHINHTRI2_FK on CO_CAPLYLUANCHINHTRI (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Table: CO_CAPQUANLYNHANUOC                                   */
/*==============================================================*/
create table CO_CAPQUANLYNHANUOC (
   MACAPQLNN            char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   constraint PK_CO_CAPQUANLYNHANUOC primary key (MACAPQLNN, MAVIENCHUC)
)
go

/*==============================================================*/
/* Index: CO_CAPQUANLYNHANUOC_FK                                */
/*==============================================================*/




create nonclustered index CO_CAPQUANLYNHANUOC_FK on CO_CAPQUANLYNHANUOC (MACAPQLNN ASC)
go

/*==============================================================*/
/* Index: CO_CAPQUANLYNHANUOC2_FK                               */
/*==============================================================*/




create nonclustered index CO_CAPQUANLYNHANUOC2_FK on CO_CAPQUANLYNHANUOC (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Table: CO_CHUCVU                                             */
/*==============================================================*/
create table CO_CHUCVU (
   MAVIENCHUC           char(10)             not null,
   MACHUCVU             char(5)              not null,
   MACOQUAN             char(5)              not null,
   MANGHENGHIEP         char(5)              not null,
   THOIGIANGIUCHUCVU    datetime             null,
   THOIGIANKETTHUCCHUCVU datetime             null,
   constraint PK_CO_CHUCVU primary key (MAVIENCHUC, MACHUCVU, MACOQUAN, MANGHENGHIEP)
)
go

/*==============================================================*/
/* Index: CO_CHUCVU_FK                                          */
/*==============================================================*/




create nonclustered index CO_CHUCVU_FK on CO_CHUCVU (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Index: CO_CHUCVU2_FK                                         */
/*==============================================================*/




create nonclustered index CO_CHUCVU2_FK on CO_CHUCVU (MACHUCVU ASC)
go

/*==============================================================*/
/* Index: CO_CHUCVU3_FK                                         */
/*==============================================================*/




create nonclustered index CO_CHUCVU3_FK on CO_CHUCVU (MACOQUAN ASC)
go

/*==============================================================*/
/* Index: CO_CHUCVU4_FK                                         */
/*==============================================================*/




create nonclustered index CO_CHUCVU4_FK on CO_CHUCVU (MANGHENGHIEP ASC)
go

/*==============================================================*/
/* Table: CO_HESOLUONG                                          */
/*==============================================================*/
create table CO_HESOLUONG (
   MABACLUONG           char(5)              not null,
   MANHOMNGACH          char(4)              not null,
   MACHITIETLUONG       char(5)              not null,
   HESOLUONG            decimal(5,3)         null,
   constraint PK_CO_HESOLUONG primary key (MABACLUONG, MANHOMNGACH, MACHITIETLUONG)
)
go

/*==============================================================*/
/* Index: CO_HESOLUONG_FK                                       */
/*==============================================================*/




create nonclustered index CO_HESOLUONG_FK on CO_HESOLUONG (MABACLUONG ASC)
go

/*==============================================================*/
/* Index: CO_HESOLUONG2_FK                                      */
/*==============================================================*/




create nonclustered index CO_HESOLUONG2_FK on CO_HESOLUONG (MANHOMNGACH ASC)
go

/*==============================================================*/
/* Index: CO_HESOLUONG3_FK                                      */
/*==============================================================*/




create nonclustered index CO_HESOLUONG3_FK on CO_HESOLUONG (MACHITIETLUONG ASC)
go

/*==============================================================*/
/* Table: CO_HOKHAUTHUONGTRU                                    */
/*==============================================================*/
create table CO_HOKHAUTHUONGTRU (
   MAVIENCHUC           char(10)             not null,
   MAXAPHUONG           char(5)              not null,
   THOIGIANDANGKYHOKHAU datetime             null,
   constraint PK_CO_HOKHAUTHUONGTRU primary key (MAVIENCHUC, MAXAPHUONG)
)
go

/*==============================================================*/
/* Index: CO_HOKHAUTHUONGTRU_FK                                 */
/*==============================================================*/




create nonclustered index CO_HOKHAUTHUONGTRU_FK on CO_HOKHAUTHUONGTRU (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Index: CO_HOKHAUTHUONGTRU2_FK                                */
/*==============================================================*/




create nonclustered index CO_HOKHAUTHUONGTRU2_FK on CO_HOKHAUTHUONGTRU (MAXAPHUONG ASC)
go

/*==============================================================*/
/* Table: CO_TAMTRU                                             */
/*==============================================================*/
create table CO_TAMTRU (
   MAVIENCHUC           char(10)             not null,
   MAXAPHUONG           char(5)              not null,
   THOIGIANDANGKYTAMTRU datetime             null,
   constraint PK_CO_TAMTRU primary key (MAVIENCHUC, MAXAPHUONG)
)
go

/*==============================================================*/
/* Index: CO_TAMTRU_FK                                          */
/*==============================================================*/




create nonclustered index CO_TAMTRU_FK on CO_TAMTRU (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Index: CO_TAMTRU2_FK                                         */
/*==============================================================*/




create nonclustered index CO_TAMTRU2_FK on CO_TAMTRU (MAXAPHUONG ASC)
go

/*==============================================================*/
/* Table: CO_TINHTRANGSK                                        */
/*==============================================================*/
create table CO_TINHTRANGSK (
   MAVIENCHUC           char(10)             not null,
   MASUCKHOE            char(5)              not null,
   CANNANG              decimal(4,2)         null,
   CHIEUCAO             smallint             null,
   THOIGIANGHINHAN      datetime             null,
   constraint PK_CO_TINHTRANGSK primary key (MAVIENCHUC, MASUCKHOE)
)
go

/*==============================================================*/
/* Index: CO_TINHTRANGSK_FK                                     */
/*==============================================================*/




create nonclustered index CO_TINHTRANGSK_FK on CO_TINHTRANGSK (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Index: CO_TINHTRANGSK2_FK                                    */
/*==============================================================*/




create nonclustered index CO_TINHTRANGSK2_FK on CO_TINHTRANGSK (MASUCKHOE ASC)
go

/*==============================================================*/
/* Table: CO_TRDCM_CAONHAT                                      */
/*==============================================================*/
create table CO_TRDCM_CAONHAT (
   MACHUYENMON          char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   constraint PK_CO_TRDCM_CAONHAT primary key (MACHUYENMON, MAVIENCHUC)
)
go

/*==============================================================*/
/* Index: CO_TRINHDOCHUYENMONCAONHAT_FK                         */
/*==============================================================*/




create nonclustered index CO_TRINHDOCHUYENMONCAONHAT_FK on CO_TRDCM_CAONHAT (MACHUYENMON ASC)
go

/*==============================================================*/
/* Table: CO_TRD_NGOAINGU                                       */
/*==============================================================*/
create table CO_TRD_NGOAINGU (
   MANGOAINGU           char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   constraint PK_CO_TRD_NGOAINGU primary key (MANGOAINGU, MAVIENCHUC)
)
go

/*==============================================================*/
/* Index: CO_TRINHDONGOAINGU_FK                                 */
/*==============================================================*/




create nonclustered index CO_TRINHDONGOAINGU_FK on CO_TRD_NGOAINGU (MANGOAINGU ASC)
go

/*==============================================================*/
/* Table: CO_TRD_TINHOC                                         */
/*==============================================================*/
create table CO_TRD_TINHOC (
   MACHUNGCHITINHOC     char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   constraint PK_CO_TRD_TINHOC primary key (MACHUNGCHITINHOC, MAVIENCHUC)
)
go

/*==============================================================*/
/* Index: CO_TRINHDOTINHOC_FK                                   */
/*==============================================================*/




create nonclustered index CO_TRINHDOTINHOC_FK on CO_TRD_TINHOC (MACHUNGCHITINHOC ASC)
go

/*==============================================================*/
/* Table: DANHHIEU                                              */
/*==============================================================*/
create table DANHHIEU (
   MADANHHIEU           char(5)              not null,
   TENDANHHIEU          varchar(30)          null,
   constraint PK_DANHHIEU primary key (MADANHHIEU)
)
go

/*==============================================================*/
/* Table: DANTOC                                                */
/*==============================================================*/
create table DANTOC (
   MADANTOC             char(5)              not null,
   TENDANTOC            varchar(30)          null,
   constraint PK_DANTOC primary key (MADANTOC)
)
go

/*==============================================================*/
/* Table: DUOC_KHENTHUONG                                       */
/*==============================================================*/
create table DUOC_KHENTHUONG (
   MAHINHTHUCKHENTHUONG char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   NAMNHANKHENTHUONG    datetime             null,
   SOQUYETDINHKHENTHUONG char(50)             null,
   NGUOIKYQUYETDINHKHENTHUONG char(150)            null,
   constraint PK_DUOC_KHENTHUONG primary key (MAHINHTHUCKHENTHUONG, MAVIENCHUC)
)
go

/*==============================================================*/
/* Index: DUOC_KHENTHUONG_FK                                    */
/*==============================================================*/




create nonclustered index DUOC_KHENTHUONG_FK on DUOC_KHENTHUONG (MAHINHTHUCKHENTHUONG ASC)
go

/*==============================================================*/
/* Index: DUOC_KHENTHUONG2_FK                                   */
/*==============================================================*/




create nonclustered index DUOC_KHENTHUONG2_FK on DUOC_KHENTHUONG (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Table: HANGTHUONGBINH                                        */
/*==============================================================*/
create table HANGTHUONGBINH (
   MAHANGTHUONGBINH     char(5)              not null,
   TENHANGTHUONGBINH    varchar(30)          null,
   constraint PK_HANGTHUONGBINH primary key (MAHANGTHUONGBINH)
)
go

/*==============================================================*/
/* Table: HINHTHUCKHENTHUONG                                    */
/*==============================================================*/
create table HINHTHUCKHENTHUONG (
   MAHINHTHUCKHENTHUONG char(5)              not null,
   TENHINHTHUCKHENTHUONG varchar(30)          null,
   constraint PK_HINHTHUCKHENTHUONG primary key (MAHINHTHUCKHENTHUONG)
)
go

/*==============================================================*/
/* Table: HINHTHUCKYLUAT                                        */
/*==============================================================*/
create table HINHTHUCKYLUAT (
   MAHINHTHUCKYLUAT     char(5)              not null,
   TENHINHTHUCKYLUAT    char(30)             null,
   constraint PK_HINHTHUCKYLUAT primary key (MAHINHTHUCKYLUAT)
)
go

/*==============================================================*/
/* Table: HOCHAM                                                */
/*==============================================================*/
create table HOCHAM (
   MAHOCHAM             char(5)              not null,
   TENHOCHAM            varchar(30)          null,
   constraint PK_HOCHAM primary key (MAHOCHAM)
)
go

/*==============================================================*/
/* Table: NGOAINGU                                              */
/*==============================================================*/
create table NGOAINGU (
   MANGOAINGU           char(5)              not null,
   TENNGOAINGU          varchar(30)          null,
   CAPDO                char(5)              null,
   constraint PK_NGOAINGU primary key (MANGOAINGU)
)
go

/*==============================================================*/
/* Table: NHOMNGACH                                             */
/*==============================================================*/
create table NHOMNGACH (
   MANHOMNGACH          char(4)              not null,
   TENNHOMNGACH         char(30)             null,
   constraint PK_NHOMNGACH primary key (MANHOMNGACH)
)
go

/*==============================================================*/
/* Table: QUANHAM                                               */
/*==============================================================*/
create table QUANHAM (
   MAQUANHAM            char(5)              not null,
   TENQUANHAM           varchar(30)          null,
   constraint PK_QUANHAM primary key (MAQUANHAM)
)
go

/*==============================================================*/
/* Table: THONGTINQUANDOI                                       */
/*==============================================================*/
create table THONGTINQUANDOI (
   MATTD_QD             char(5)              not null,
   constraint PK_THONGTINQUANDOI primary key (MATTD_QD)
)
go

/*==============================================================*/
/* Table: THUOC_NHOM_NGACH                                      */
/*==============================================================*/
create table THUOC_NHOM_NGACH (
   MAVIENCHUC           char(10)             not null,
   MACHITIETLUONG       char(5)              not null,
   THOIGIANBATDAUHUONG  datetime             null,
   constraint PK_THUOC_NHOM_NGACH primary key (MAVIENCHUC, MACHITIETLUONG)
)
go

/*==============================================================*/
/* Index: THUOC_NHOM_NGACH_FK                                   */
/*==============================================================*/




create nonclustered index THUOC_NHOM_NGACH_FK on THUOC_NHOM_NGACH (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Index: THUOC_NHOM_NGACH2_FK                                  */
/*==============================================================*/




create nonclustered index THUOC_NHOM_NGACH2_FK on THUOC_NHOM_NGACH (MACHITIETLUONG ASC)
go

/*==============================================================*/
/* Table: THUOC_QUANDOI                                         */
/*==============================================================*/
create table THUOC_QUANDOI (
   MAVIENCHUC           char(10)             not null,
   MATTD_QD             char(5)              not null,
   MAQUANHAM            char(5)              not null,
   NGAYNHAPNGU          datetime             null,
   NGAYXUATNGU          datetime             null,
   NOINHAPNGU           text                 null,
   constraint PK_THUOC_QUANDOI primary key (MAVIENCHUC, MATTD_QD, MAQUANHAM)
)
go

/*==============================================================*/
/* Index: THUOC_QUANDOI_FK                                      */
/*==============================================================*/




create nonclustered index THUOC_QUANDOI_FK on THUOC_QUANDOI (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Index: THUOC_QUANDOI2_FK                                     */
/*==============================================================*/




create nonclustered index THUOC_QUANDOI2_FK on THUOC_QUANDOI (MATTD_QD ASC)
go

/*==============================================================*/
/* Index: THUOC_QUANDOI3_FK                                     */
/*==============================================================*/




create nonclustered index THUOC_QUANDOI3_FK on THUOC_QUANDOI (MAQUANHAM ASC)
go

/*==============================================================*/
/* Table: THUOC_TOCHUCDOANTHECHINHTRIXAHOI                      */
/*==============================================================*/
create table THUOC_TOCHUCDOANTHECHINHTRIXAHOI (
   MAVIENCHUC           char(10)             not null,
   MATOCHUCDTCTXH       char(5)              not null,
   NGAYVAOTOCHUC        datetime             null,
   NGAYCHINHTHUC        datetime             null,
   NGUOIGIOITHIEU       text                 null,
   LANVAOTOCHUC         smallint             null,
   constraint PK_THUOC_TOCHUCDOANTHECHINHTRI primary key (MAVIENCHUC, MATOCHUCDTCTXH)
)
go

/*==============================================================*/
/* Index: THUOC_TOCHUCDOANTHECHINHTRIXAHOI_FK                   */
/*==============================================================*/




create nonclustered index THUOC_TOCHUCDOANTHECHINHTRIXAHOI_FK on THUOC_TOCHUCDOANTHECHINHTRIXAHOI (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Index: THUOC_TOCHUCDOANTHECHINHTRIXAHOI2_FK                  */
/*==============================================================*/




create nonclustered index THUOC_TOCHUCDOANTHECHINHTRIXAHOI2_FK on THUOC_TOCHUCDOANTHECHINHTRIXAHOI (MATOCHUCDTCTXH ASC)
go

/*==============================================================*/
/* Table: TINHTHANH                                             */
/*==============================================================*/
create table TINHTHANH (
   MATINHTHANH          char(5)              not null,
   TENTINHTHANH         varchar(30)          null,
   constraint PK_TINHTHANH primary key (MATINHTHANH)
)
go

/*==============================================================*/
/* Table: TINHTRANGSUCKHOE                                      */
/*==============================================================*/
create table TINHTRANGSUCKHOE (
   MASUCKHOE            char(5)              not null,
   TINHTRANGSUCKHOE     varchar(20)          null,
   constraint PK_TINHTRANGSUCKHOE primary key (MASUCKHOE)
)
go

/*==============================================================*/
/* Table: TOCHUCDOANTHECHINHTRIXAHOI                            */
/*==============================================================*/
create table TOCHUCDOANTHECHINHTRIXAHOI (
   MATOCHUCDTCTXH       char(5)              not null,
   TENTOCHUCDTCTXH      text                 null,
   constraint PK_TOCHUCDOANTHECHINHTRIXAHOI primary key (MATOCHUCDTCTXH)
)
go

/*==============================================================*/
/* Table: TONGIAO                                               */
/*==============================================================*/
create table TONGIAO (
   MATONGIAO            char(5)              not null,
   TENTONGIAO           varchar(30)          null,
   constraint PK_TONGIAO primary key (MATONGIAO)
)
go

/*==============================================================*/
/* Table: TRINHDOHOCVAN                                         */
/*==============================================================*/
create table TRINHDOHOCVAN (
   MATRINHDO            char(5)              not null,
   TRINHDOGIAODUCPHOTHONG char(5)              null,
   TRINHDONGHIEPVUCHUYENNGANH varchar(100)         null,
   constraint PK_TRINHDOHOCVAN primary key (MATRINHDO)
)
go

/*==============================================================*/
/* Table: TUYENDUNG                                             */
/*==============================================================*/
create table TUYENDUNG (
   MANGHENGHIEP         char(5)              not null,
   MAVIENCHUC           char(10)             not null,
   MACOQUAN             char(5)              not null,
   NGAYTUYENDUNG        datetime             null,
   constraint PK_TUYENDUNG primary key (MANGHENGHIEP, MAVIENCHUC, MACOQUAN)
)
go

/*==============================================================*/
/* Index: TUYENDUNG_FK                                          */
/*==============================================================*/




create nonclustered index TUYENDUNG_FK on TUYENDUNG (MANGHENGHIEP ASC)
go

/*==============================================================*/
/* Index: TUYENDUNG2_FK                                         */
/*==============================================================*/




create nonclustered index TUYENDUNG2_FK on TUYENDUNG (MAVIENCHUC ASC)
go

/*==============================================================*/
/* Index: TUYENDUNG3_FK                                         */
/*==============================================================*/




create nonclustered index TUYENDUNG3_FK on TUYENDUNG (MACOQUAN ASC)
go

/*==============================================================*/
/* Table: VIENCHUC                                              */
/*==============================================================*/
create table VIENCHUC (
   MAVIENCHUC           char(10)             not null,
   MADANHHIEU           char(5)              null,
   MATONGIAO            char(5)              null,
   MAHOCHAM             char(5)              null,
   MATRINHDO            char(5)              not null,
   MADANTOC             char(5)              not null,
   MAHANGTHUONGBINH     char(5)              null,
   MAXAPHUONG           char(5)              not null,
   XAP_MAXAPHUONG       char(5)              not null,
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
go

/*==============================================================*/
/* Index: CO_TRINHDOHOCVAN_FK                                   */
/*==============================================================*/




create nonclustered index CO_TRINHDOHOCVAN_FK on VIENCHUC (MATRINHDO ASC)
go

/*==============================================================*/
/* Index: VIENCHUC_CO_DANTOC_FK                                 */
/*==============================================================*/




create nonclustered index VIENCHUC_CO_DANTOC_FK on VIENCHUC (MADANTOC ASC)
go

/*==============================================================*/
/* Index: CO_TONGIAO_FK                                         */
/*==============================================================*/




create nonclustered index CO_TONGIAO_FK on VIENCHUC (MATONGIAO ASC)
go

/*==============================================================*/
/* Index: CO_NOISINH_FK                                         */
/*==============================================================*/




create nonclustered index CO_NOISINH_FK on VIENCHUC (XAP_MAXAPHUONG ASC)
go

/*==============================================================*/
/* Index: CO_QUEQUAN_FK                                         */
/*==============================================================*/




create nonclustered index CO_QUEQUAN_FK on VIENCHUC (MAXAPHUONG ASC)
go

/*==============================================================*/
/* Index: DUOCPHONG_HOCHAM_FK                                   */
/*==============================================================*/




create nonclustered index DUOCPHONG_HOCHAM_FK on VIENCHUC (MAHOCHAM ASC)
go

/*==============================================================*/
/* Index: DUOCPHONG_DANHHIEU_FK                                 */
/*==============================================================*/




create nonclustered index DUOCPHONG_DANHHIEU_FK on VIENCHUC (MADANHHIEU ASC)
go

/*==============================================================*/
/* Index: CO_HANGTHUONGBINH_FK                                  */
/*==============================================================*/




create nonclustered index CO_HANGTHUONGBINH_FK on VIENCHUC (MAHANGTHUONGBINH ASC)
go

/*==============================================================*/
/* Table: XAPHUONG                                              */
/*==============================================================*/
create table XAPHUONG (
   MAXAPHUONG           char(5)              not null,
   MATINHTHANH          char(5)              not null,
   TENXAPHUONG          varchar(30)          null,
   constraint PK_XAPHUONG primary key (MAXAPHUONG)
)
go

/*==============================================================*/
/* Index: TRUCTHUOC_FK                                          */
/*==============================================================*/




create nonclustered index TRUCTHUOC_FK on XAPHUONG (MATINHTHANH ASC)
go

alter table BI_KYLUAT
   add constraint FK_BI_KYLUA_BI_KYLUAT_HINHTHUC foreign key (MAHINHTHUCKYLUAT)
      references HINHTHUCKYLUAT (MAHINHTHUCKYLUAT)
go

alter table BI_KYLUAT
   add constraint FK_BI_KYLUA_BI_KYLUAT_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table CO_CAPLYLUANCHINHTRI
   add constraint FK_CO_CAPLY_CO_CAPLYL_CAPLYLUA foreign key (MACAPCT)
      references CAPLYLUANCHINHTRI (MACAPCT)
go

alter table CO_CAPLYLUANCHINHTRI
   add constraint FK_CO_CAPLY_CO_CAPLYL_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table CO_CAPQUANLYNHANUOC
   add constraint FK_CO_CAPQU_CO_CAPQUA_CAPQUANL foreign key (MACAPQLNN)
      references CAPQUANLYNHANUOC (MACAPQLNN)
go

alter table CO_CAPQUANLYNHANUOC
   add constraint FK_CO_CAPQU_CO_CAPQUA_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table CO_CHUCVU
   add constraint FK_CO_CHUCV_CO_CHUCVU_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table CO_CHUCVU
   add constraint FK_CO_CHUCV_CO_CHUCVU_CHUCVU foreign key (MACHUCVU)
      references CHUCVU (MACHUCVU)
go

alter table CO_CHUCVU
   add constraint FK_CO_CHUCV_CO_CHUCVU_COQUAN foreign key (MACOQUAN)
      references COQUAN (MACOQUAN)
go

alter table CO_CHUCVU
   add constraint FK_CO_CHUCV_CO_CHUCVU_CHUCDANH foreign key (MANGHENGHIEP)
      references CHUCDANH_NGHENGHIEP (MANGHENGHIEP)
go

alter table CO_HESOLUONG
   add constraint FK_CO_HESOL_CO_HESOLU_BACLUONG foreign key (MABACLUONG)
      references BACLUONG (MABACLUONG)
go

alter table CO_HESOLUONG
   add constraint FK_CO_HESOL_CO_HESOLU_NHOMNGAC foreign key (MANHOMNGACH)
      references NHOMNGACH (MANHOMNGACH)
go

alter table CO_HESOLUONG
   add constraint FK_CO_HESOL_CO_HESOLU_CHITIETL foreign key (MACHITIETLUONG)
      references CHITIETLUONG (MACHITIETLUONG)
go

alter table CO_HOKHAUTHUONGTRU
   add constraint FK_CO_HOKHA_CO_HOKHAU_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table CO_HOKHAUTHUONGTRU
   add constraint FK_CO_HOKHA_CO_HOKHAU_XAPHUONG foreign key (MAXAPHUONG)
      references XAPHUONG (MAXAPHUONG)
go

alter table CO_TAMTRU
   add constraint FK_CO_TAMTR_CO_TAMTRU_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table CO_TAMTRU
   add constraint FK_CO_TAMTR_CO_TAMTRU_XAPHUONG foreign key (MAXAPHUONG)
      references XAPHUONG (MAXAPHUONG)
go

alter table CO_TINHTRANGSK
   add constraint FK_CO_TINHT_CO_TINHTR_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table CO_TINHTRANGSK
   add constraint FK_CO_TINHT_CO_TINHTR_TINHTRAN foreign key (MASUCKHOE)
      references TINHTRANGSUCKHOE (MASUCKHOE)
go

alter table CO_TRDCM_CAONHAT
   add constraint FK_CO_TRDCM_CO_TRDCM__CHUYENMO foreign key (MACHUYENMON)
      references CHUYENMON (MACHUYENMON)
go

alter table CO_TRDCM_CAONHAT
   add constraint FK_CO_TRDCM_CO_TRDCM__VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table CO_TRD_NGOAINGU
   add constraint FK_CO_TRD_N_CO_TRD_NG_NGOAINGU foreign key (MANGOAINGU)
      references NGOAINGU (MANGOAINGU)
go

alter table CO_TRD_NGOAINGU
   add constraint FK_CO_TRD_N_CO_TRD_NG_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table CO_TRD_TINHOC
   add constraint FK_CO_TRD_T_CO_TRD_TI_CHUNGCHI foreign key (MACHUNGCHITINHOC)
      references CHUNGCHITINHOC (MACHUNGCHITINHOC)
go

alter table CO_TRD_TINHOC
   add constraint FK_CO_TRD_T_CO_TRD_TI_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table DUOC_KHENTHUONG
   add constraint FK_DUOC_KHE_DUOC_KHEN_HINHTHUC foreign key (MAHINHTHUCKHENTHUONG)
      references HINHTHUCKHENTHUONG (MAHINHTHUCKHENTHUONG)
go

alter table DUOC_KHENTHUONG
   add constraint FK_DUOC_KHE_DUOC_KHEN_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table THUOC_NHOM_NGACH
   add constraint FK_THUOC_NH_THUOC_NHO_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table THUOC_NHOM_NGACH
   add constraint FK_THUOC_NH_THUOC_NHO_CHITIETL foreign key (MACHITIETLUONG)
      references CHITIETLUONG (MACHITIETLUONG)
go

alter table THUOC_QUANDOI
   add constraint FK_THUOC_QU_THUOC_QUA_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table THUOC_QUANDOI
   add constraint FK_THUOC_QU_THUOC_QUA_THONGTIN foreign key (MATTD_QD)
      references THONGTINQUANDOI (MATTD_QD)
go

alter table THUOC_QUANDOI
   add constraint FK_THUOC_QU_THUOC_QUA_QUANHAM foreign key (MAQUANHAM)
      references QUANHAM (MAQUANHAM)
go

alter table THUOC_TOCHUCDOANTHECHINHTRIXAHOI
   add constraint FK_THUOC_TO_THUOC_TOC_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table THUOC_TOCHUCDOANTHECHINHTRIXAHOI
   add constraint FK_THUOC_TO_THUOC_TOC_TOCHUCDO foreign key (MATOCHUCDTCTXH)
      references TOCHUCDOANTHECHINHTRIXAHOI (MATOCHUCDTCTXH)
go

alter table TUYENDUNG
   add constraint FK_TUYENDUN_TUYENDUNG_CHUCDANH foreign key (MANGHENGHIEP)
      references CHUCDANH_NGHENGHIEP (MANGHENGHIEP)
go

alter table TUYENDUNG
   add constraint FK_TUYENDUN_TUYENDUNG_VIENCHUC foreign key (MAVIENCHUC)
      references VIENCHUC (MAVIENCHUC)
go

alter table TUYENDUNG
   add constraint FK_TUYENDUN_TUYENDUNG_COQUAN foreign key (MACOQUAN)
      references COQUAN (MACOQUAN)
go

alter table VIENCHUC
   add constraint FK_VIENCHUC_CO_HANGTH_HANGTHUO foreign key (MAHANGTHUONGBINH)
      references HANGTHUONGBINH (MAHANGTHUONGBINH)
go

alter table VIENCHUC
   add constraint FK_VIENCHUC_CO_NOISIN_XAPHUONG foreign key (XAP_MAXAPHUONG)
      references XAPHUONG (MAXAPHUONG)
go

alter table VIENCHUC
   add constraint FK_VIENCHUC_CO_QUEQUA_XAPHUONG foreign key (MAXAPHUONG)
      references XAPHUONG (MAXAPHUONG)
go

alter table VIENCHUC
   add constraint FK_VIENCHUC_CO_TONGIA_TONGIAO foreign key (MATONGIAO)
      references TONGIAO (MATONGIAO)
go

alter table VIENCHUC
   add constraint FK_VIENCHUC_CO_TRINHD_TRINHDOH foreign key (MATRINHDO)
      references TRINHDOHOCVAN (MATRINHDO)
go

alter table VIENCHUC
   add constraint FK_VIENCHUC_DUOCPHONG_DANHHIEU foreign key (MADANHHIEU)
      references DANHHIEU (MADANHHIEU)
go

alter table VIENCHUC
   add constraint FK_VIENCHUC_DUOCPHONG_HOCHAM foreign key (MAHOCHAM)
      references HOCHAM (MAHOCHAM)
go

alter table VIENCHUC
   add constraint FK_VIENCHUC_VIENCHUC__DANTOC foreign key (MADANTOC)
      references DANTOC (MADANTOC)
go

alter table XAPHUONG
   add constraint FK_XAPHUONG_TRUCTHUOC_TINHTHAN foreign key (MATINHTHANH)
      references TINHTHANH (MATINHTHANH)
go