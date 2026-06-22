DELIMITER $$
CREATE TRIGGER TRG_CO_CHUCVU_BI
BEFORE INSERT ON CO_CHUCVU
FOR EACH ROW
BEGIN
    DECLARE v_count INT DEFAULT 0;

    -- * End date > start date
    IF NEW.THOIGIANKETTHUCCHUCVU IS NOT NULL
       AND NEW.THOIGIANKETTHUCCHUCVU < NEW.THOIGIANGIUCHUCVU THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'THOIGIANKETTHUCCHUCVU >= THOIGIANGIUCHUCVU';
    END IF;

    -- * Only one active position allowed
    IF NEW.THOIGIANKETTHUCCHUCVU IS NULL THEN

        SELECT COUNT(*)
        INTO v_count
        FROM CO_CHUCVU
        WHERE MAVIENCHUC = NEW.MAVIENCHUC
          AND THOIGIANKETTHUCCHUCVU IS NULL;

        IF v_count > 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Vien chuc hien tai da co chuc vu';
        END IF;

    END IF;

    -- * No overlapping periods
    SELECT COUNT(*)
    INTO v_count
    FROM CO_CHUCVU
    WHERE MAVIENCHUC = NEW.MAVIENCHUC
      AND (
            COALESCE(NEW.THOIGIANKETTHUCCHUCVU,'9999-12-31')
                >= THOIGIANGIUCHUCVU
        AND
            COALESCE(THOIGIANKETTHUCCHUCVU,'9999-12-31')
                >= NEW.THOIGIANGIUCHUCVU
      );

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'thoi gian giu chuc vu trung lap';
    END IF;

END$$

-- ! TRIGGER TRG_CO_CHUCVU_BU

CREATE TRIGGER TRG_CO_CHUCVU_BU
BEFORE UPDATE ON CO_CHUCVU
FOR EACH ROW
BEGIN
    DECLARE v_count INT DEFAULT 0;

    -- * End date > start date
    IF NEW.THOIGIANKETTHUCCHUCVU IS NOT NULL
       AND NEW.THOIGIANKETTHUCCHUCVU < NEW.THOIGIANGIUCHUCVU THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'THOIGIANKETTHUCCHUCVU >= THOIGIANGIUCHUCVU';
    END IF;

    -- * chi 1 chuc vu 1 lan
    IF NEW.THOIGIANKETTHUCCHUCVU IS NULL THEN

        SELECT COUNT(*)
        INTO v_count
        FROM CO_CHUCVU
        WHERE MAVIENCHUC = NEW.MAVIENCHUC
          AND THOIGIANKETTHUCCHUCVU IS NULL
          AND NOT (
                MAVIENCHUC = OLD.MAVIENCHUC
            AND MACHUCVU = OLD.MACHUCVU
            AND MACOQUAN = OLD.MACOQUAN
            AND MANGHENGHIEP = OLD.MANGHENGHIEP
          );

        IF v_count > 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Vien chuc da co chuc vu';
        END IF;

    END IF;

    -- * No overlapping periods
    SELECT COUNT(*)
    INTO v_count
    FROM CO_CHUCVU
    WHERE MAVIENCHUC = NEW.MAVIENCHUC
      AND NOT (
            MAVIENCHUC = OLD.MAVIENCHUC
        AND MACHUCVU = OLD.MACHUCVU
        AND MACOQUAN = OLD.MACOQUAN
        AND MANGHENGHIEP = OLD.MANGHENGHIEP
      )
      AND (
            COALESCE(NEW.THOIGIANKETTHUCCHUCVU,'9999-12-31')
                >= THOIGIANGIUCHUCVU
        AND
            COALESCE(THOIGIANKETTHUCCHUCVU,'9999-12-31')
                >= NEW.THOIGIANGIUCHUCVU
      );

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Chuc vu bi trung lap';
    END IF;

END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER TRG_THUOC_QUANDOI_BI
BEFORE INSERT ON THUOC_QUANDOI
FOR EACH ROW
BEGIN
    IF NEW.NGAYXUATNGU IS NOT NULL
       AND NEW.NGAYXUATNGU < NEW.NGAYNHAPNGU THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngay xuat ngu phai sau ngay nhap ngu';

    END IF;
END$$

CREATE TRIGGER TRG_THUOC_QUANDOI_BU
BEFORE UPDATE ON THUOC_QUANDOI
FOR EACH ROW
BEGIN
    IF NEW.NGAYXUATNGU IS NOT NULL
       AND NEW.NGAYXUATNGU < NEW.NGAYNHAPNGU THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngay xuat ngu phai sau ngay nhap ngu';

    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER TRG_TCDT_CTXH_BI
BEFORE INSERT ON THUOC_TOCHUCDOANTHECHINHTRIXAHOI
FOR EACH ROW
BEGIN
    IF NEW.NGAYCHINHTHUC IS NOT NULL
       AND NEW.NGAYCHINHTHUC < NEW.NGAYVAOTOCHUC THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngay chinh thuc phai sau ngay vao to chuc';

    END IF;
END$$

CREATE TRIGGER TRG_TCDT_CTXH_BU
BEFORE UPDATE ON THUOC_TOCHUCDOANTHECHINHTRIXAHOI
FOR EACH ROW
BEGIN
    IF NEW.NGAYCHINHTHUC IS NOT NULL
       AND NEW.NGAYCHINHTHUC < NEW.NGAYVAOTOCHUC THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngay chinh thuc phai sau ngay vao to chuc';

    END IF;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER TRG_CO_TINHTRANGSK_BI
BEFORE INSERT ON CO_TINHTRANGSK
FOR EACH ROW
BEGIN

    IF NEW.CANNANG <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Can nang khong hop le';
    END IF;

    IF NEW.CHIEUCAO <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Chieu cao khong hop le';
    END IF;

    IF NEW.CANNANG < 40 OR NEW.CANNANG > 150 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Can nang ngoai pham vi cho phep';
    END IF;

    IF NEW.CHIEUCAO < 100 OR NEW.CHIEUCAO > 250 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Chieu cao ngoai pham vi cho phep';
    END IF;

END$$

CREATE TRIGGER TRG_CO_TINHTRANGSK_BU
BEFORE UPDATE ON CO_TINHTRANGSK
FOR EACH ROW
BEGIN

    IF NEW.CANNANG <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Can nang khong hop le';
    END IF;

    IF NEW.CHIEUCAO <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Chieu cao khong hop le';
    END IF;

END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER TRG_DUOC_KHENTHUONG_BI
BEFORE INSERT ON DUOC_KHENTHUONG
FOR EACH ROW
BEGIN
    DECLARE v_ngaytuyendung DATETIME;

    SELECT NGAYTUYENDUNG
    INTO v_ngaytuyendung
    FROM VIENCHUC
    WHERE MAVIENCHUC = NEW.MAVIENCHUC;

    IF NEW.NAMNHANKHENTHUONG < v_ngaytuyendung THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Khen thuong truoc ngay tuyen dung';
    END IF;
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER TRG_BI_KYLUAT_BI
BEFORE INSERT ON BI_KYLUAT
FOR EACH ROW
BEGIN
    DECLARE v_ngaytuyendung DATETIME;

    SELECT NGAYTUYENDUNG
    INTO v_ngaytuyendung
    FROM VIENCHUC
    WHERE MAVIENCHUC = NEW.MAVIENCHUC;

    IF NEW.NAMBIKYLUAT < v_ngaytuyendung THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ky luat truoc ngay tuyen dung';
    END IF;
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER TRG_TUYENDUNG_BI
BEFORE INSERT ON TUYENDUNG
FOR EACH ROW
BEGIN
    DECLARE v_ngaysinh DATETIME;

    SELECT NGAYSINH
    INTO v_ngaysinh
    FROM VIENCHUC
    WHERE MAVIENCHUC = NEW.MAVIENCHUC;

    IF NEW.NGAYTUYENDUNG < v_ngaysinh THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngay tuyen dung khong hop le';
    END IF;

    IF TIMESTAMPDIFF(YEAR,v_ngaysinh,NEW.NGAYTUYENDUNG) < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Vien chuc phai du 18 tuoi';
    END IF;
END$$

DELIMITER ;


DELIMITER $$

DELIMITER $$

CREATE TRIGGER TRG_VIENCHUC_BI
BEFORE INSERT ON VIENCHUC
FOR EACH ROW
BEGIN
    DECLARE tuoi_cap_cccd INT;
    DECLARE ngay_het_han DATE;

    IF NEW.NGAYSINH > NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngay sinh khong hop le';
    END IF;

    IF NEW.NGAYTUYENDUNG < NEW.NGAYSINH THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngay tuyen dung phai sau ngay sinh';
    END IF;

    IF TIMESTAMPDIFF(YEAR, NEW.NGAYSINH, NEW.NGAYTUYENDUNG) < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Vien chuc phai du 18 tuoi';
    END IF;

    IF TIMESTAMPDIFF(YEAR, NEW.NGAYSINH, NEW.NGAYTUYENDUNG) >= 80 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Vien chuc phai nho hon 80 tuoi';
    END IF;

    IF NEW.SOCCCD IS NOT NULL
       AND NEW.SOCCCD NOT REGEXP '^[0-9]{12}$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'So CCCD phai gom dung 12 chu so';
    END IF;

    -- Issue date cannot be in future
    IF NEW.NGAYCAPCCCD > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ngay cap CCCD khong hop le';
    END IF;

    SET tuoi_cap_cccd =
        TIMESTAMPDIFF(YEAR, NEW.NGAYSINH, NEW.NGAYCAPCCCD);

    IF tuoi_cap_cccd < 25 THEN
        SET ngay_het_han = DATE_ADD(NEW.NGAYSINH, INTERVAL 26 YEAR);

    ELSEIF tuoi_cap_cccd < 40 THEN
        SET ngay_het_han = DATE_ADD(NEW.NGAYSINH, INTERVAL 41 YEAR);

    ELSEIF tuoi_cap_cccd < 60 THEN
        SET ngay_het_han = DATE_ADD(NEW.NGAYSINH, INTERVAL 61 YEAR);

    ELSE
        SET ngay_het_han = NULL;
    END IF;

    IF ngay_het_han IS NOT NULL
       AND CURDATE() > ngay_het_han THEN
        SIGNAL SQLSTATE '01000'
        SET MESSAGE_TEXT = 'CCCD da het han theo quy dinh doi the';
    END IF;

END$$

DELIMITER ;

DELIMITER ;
-- ! TRIGGER FOR HỌC VỊ

DELIMITER $$

CREATE TRIGGER TRG_VIENCHUC_CHECK_HOCVI_BI
BEFORE INSERT ON VIENCHUC
FOR EACH ROW
BEGIN
    DECLARE v_hocvi VARCHAR(100);
    DECLARE v_tuoi INT;
    DECLARE v_tuoitoithieu INT DEFAULT 18;

    -- * Lấy học vị từ bảng TRINHDOHOCVAN
    SELECT TRINHDONGHIEPVUCHUYENNGANH
    INTO v_hocvi
    FROM TRINHDOHOCVAN
    WHERE MATRINHDO = NEW.MATRINHDO;

    SET v_tuoi = TIMESTAMPDIFF(YEAR, NEW.NGAYSINH, CURDATE());

    CASE
        WHEN v_hocvi = 'Cao đẳng' THEN
            SET v_tuoitoithieu = 20;

        WHEN v_hocvi = 'Cử nhân' THEN
            SET v_tuoitoithieu = 22;

        WHEN v_hocvi = 'Thạc sĩ' THEN
            SET v_tuoitoithieu = 24;

        WHEN v_hocvi = 'Tiến sĩ' THEN
            SET v_tuoitoithieu = 27;
        ELSE
            SET v_tuoitoithieu =18;
    END CASE;

    IF v_tuoi < v_tuoitoithieu THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Khong du tuoi toi thieu cho hoc vi ';
    END IF;

END$$

DELIMITER ;
-- * HOC VI BU

DELIMITER $$

CREATE TRIGGER TRG_VIENCHUC_CHECK_HOCVI_BU
BEFORE UPDATE ON VIENCHUC
FOR EACH ROW
BEGIN
    DECLARE v_hocvi VARCHAR(100);
    DECLARE v_tuoi INT;
    DECLARE v_tuoitoithieu INT DEFAULT 18;

    SELECT TRINHDONGHIEPVUCHUYENNGANH
    INTO v_hocvi
    FROM TRINHDOHOCVAN
    WHERE MATRINHDO = NEW.MATRINHDO;

    SET v_tuoi = TIMESTAMPDIFF(YEAR, NEW.NGAYSINH, CURDATE());

    CASE
        WHEN v_hocvi = 'Cao đẳng' THEN
            SET v_tuoitoithieu = 20;

        WHEN v_hocvi = 'Cử nhân' THEN
            SET v_tuoitoithieu = 22;

        WHEN v_hocvi = 'Thạc sĩ' THEN
            SET v_tuoitoithieu = 24;
        WHEN v_hocvi = 'Tiến sĩ' THEN
            SET v_tuoitoithieu = 27;
        ELSE
            SET v_tuoitoithieu = 18;
    END CASE;

    IF v_tuoi < v_tuoitoithieu THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT ='Khong du tuoi toi thieu cho hoc vi ';
    END IF;

END$$

DELIMITER ;


--   !  TRIGGER FOR LOG

DELIMITER $$

CREATE TRIGGER TR_VIENCHUC_AI
AFTER INSERT ON VIENCHUC
FOR EACH ROW
BEGIN
    INSERT INTO AUDIT_LOG
    (
        TABLE_NAME,
        RECORD_ID,
        ACTION_TYPE,
        OLD_DATA,
        NEW_DATA,
        UPDATED_BY
    )
    VALUES
    (
        'VIENCHUC',
        NEW.MAVIENCHUC,
        'INSERT',
        NULL,

        JSON_OBJECT(
            'MAVIENCHUC', NEW.MAVIENCHUC,
            'HO', NEW.HO,
            'TENLOT', NEW.TENLOT,
            'TEN', NEW.TEN
        ),

        CURRENT_USER()
    );
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER TR_VIENCHUC_AU
AFTER UPDATE ON VIENCHUC
FOR EACH ROW
BEGIN
    INSERT INTO AUDIT_LOG
    (
        TABLE_NAME,
        RECORD_ID,
        ACTION_TYPE,
        OLD_DATA,
        NEW_DATA,
        UPDATED_BY
    )
    VALUES
    (
        'VIENCHUC',
        NEW.MAVIENCHUC,
        'UPDATE',

        JSON_OBJECT(
            'MAVIENCHUC', OLD.MAVIENCHUC,
            'HO', OLD.HO,
            'TENLOT', OLD.TENLOT,
            'TEN', OLD.TEN
        ),

        JSON_OBJECT(
            'MAVIENCHUC', NEW.MAVIENCHUC,
            'HO', NEW.HO,
            'TENLOT', NEW.TENLOT,
            'TEN', NEW.TEN
        ),

        CURRENT_USER()
    );
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER TR_VIENCHUC_AD
AFTER DELETE ON VIENCHUC
FOR EACH ROW
BEGIN
    INSERT INTO AUDIT_LOG
    (
        TABLE_NAME,
        RECORD_ID,
        ACTION_TYPE,
        OLD_DATA,
        NEW_DATA,
        UPDATED_BY
    )
    VALUES
    (
        'VIENCHUC',
        OLD.MAVIENCHUC,
        'DELETE',

        JSON_OBJECT(
            'MAVIENCHUC', OLD.MAVIENCHUC,
            'HO', OLD.HO,
            'TENLOT', OLD.TENLOT,
            'TEN', OLD.TEN
        ),

        NULL,

        CURRENT_USER()
    );
END$$

DELIMITER ;

-- ! 