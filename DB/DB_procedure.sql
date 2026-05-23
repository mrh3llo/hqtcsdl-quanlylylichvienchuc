DELIMITER $$

CREATE PROCEDURE SP_LAY_THONGTIN_VIENCHUC (
    IN p_MAVIENCHUC CHAR(10)
)
BEGIN
    SELECT 
        vc.MAVIENCHUC,
        vc.HO,
        vc.TENLOT,
        vc.TEN,
        vc.NGAYSINH,
        vc.GIOITINH,
        dt.TENDANTOC,
        tg.TENTONGIAO,
        td.TRINHDOGIAODUCPHOTHONG,
        hh.TENHOCHAM,
        dd.TENDANHHIEU
    FROM VIENCHUC vc
    LEFT JOIN DANTOC dt 
        ON vc.MADANTOC = dt.MADANTOC
    LEFT JOIN TONGIAO tg 
        ON vc.MATONGIAO = tg.MATONGIAO
    LEFT JOIN TRINHDOHOCVAN td 
        ON vc.MATRINHDO = td.MATRINHDO
    LEFT JOIN HOCHAM hh 
        ON vc.MAHOCHAM = hh.MAHOCHAM
    LEFT JOIN DANHHIEU dd 
        ON vc.MADANHHIEU = dd.MADANHHIEU
    WHERE vc.MAVIENCHUC = p_MAVIENCHUC;
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_THEM_VIENCHUC (
    IN p_mavienchuc CHAR(10),
    IN p_ho VARCHAR(20),
    IN p_tenlot VARCHAR(40),
    IN p_ten VARCHAR(20),
    IN p_ngaysinh DATETIME,
    IN p_gioitinh VARCHAR(3),
    IN p_madantoc CHAR(5),
    IN p_matrinhdo CHAR(5),
    IN p_maxaphuong CHAR(5)
)
BEGIN
    INSERT INTO VIENCHUC (
        MAVIENCHUC,
        HO,
        TENLOT,
        TEN,
        NGAYSINH,
        GIOITINH,
        MADANTOC,
        MATRINHDO,
        MAXAPHUONG,
        XAP_MAXAPHUONG
    )
    VALUES (
        p_mavienchuc,
        p_ho,
        p_tenlot,
        p_ten,
        p_ngaysinh,
        p_gioitinh,
        p_madantoc,
        p_matrinhdo,
        p_maxaphuong,
        p_maxaphuong
    );
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_SUA_VIENCHUC (
    IN p_mavienchuc CHAR(10),
    IN p_ho VARCHAR(20),
    IN p_tenlot VARCHAR(40),
    IN p_ten VARCHAR(20),
    IN p_ngaysinh DATETIME,
    IN p_gioitinh VARCHAR(3),
    IN p_madantoc CHAR(5),
    IN p_matrinhdo CHAR(5),
    IN p_maxaphuong CHAR(5)
)
BEGIN
    UPDATE VIENCHUC
    SET
        HO = p_ho,
        TENLOT = p_tenlot,
        TEN = p_ten,
        NGAYSINH = p_ngaysinh,
        GIOITINH = p_gioitinh,
        MADANTOC = p_madantoc,
        MATRINHDO = p_matrinhdo,
        MAXAPHUONG = p_maxaphuong,
        XAP_MAXAPHUONG = p_maxaphuong
    WHERE MAVIENCHUC = p_mavienchuc;
END$$

DELIMITER ;

-- =========================================================
-- CHUC VU
-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_THEM_CHUCVU (
    IN p_mavienchuc CHAR(10),
    IN p_machucvu CHAR(5),
    IN p_macoquan CHAR(5),
    IN p_manghenghiep CHAR(5),
    IN p_start DATETIME
)
BEGIN
    INSERT INTO CO_CHUCVU (
        MAVIENCHUC,
        MACHUCVU,
        MACOQUAN,
        MANGHENGHIEP,
        THOIGIANGIUCHUCVU
    )
    VALUES (
        p_mavienchuc,
        p_machucvu,
        p_macoquan,
        p_manghenghiep,
        p_start
    );
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_LAY_CHUCVU (
    IN p_mavienchuc CHAR(10)
)
BEGIN
    SELECT 
        cv.MACHUCVU,
        cv.MACOQUAN,
        cv.MANGHENGHIEP,
        cv.THOIGIANGIUCHUCVU,
        q.TENCOQUAN,
        n.TENNGHENGHIEP,
        c.TENCHUCVU
    FROM CO_CHUCVU cv
    JOIN COQUAN q 
        ON cv.MACOQUAN = q.MACOQUAN
    JOIN CHUCDANH_NGHENGHIEP n 
        ON cv.MANGHENGHIEP = n.MANGHENGHIEP
    JOIN CHUCVU c 
        ON cv.MACHUCVU = c.MACHUCVU
    WHERE cv.MAVIENCHUC = p_mavienchuc;
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_SUA_CHUCVU (
    IN p_old_mavienchuc CHAR(10),
    IN p_old_machucvu CHAR(5),
    IN p_old_macoquan CHAR(5),
    IN p_old_manghenghiep CHAR(5),

    IN p_new_machucvu CHAR(5),
    IN p_new_macoquan CHAR(5),
    IN p_new_manghenghiep CHAR(5),
    IN p_start DATETIME
)
BEGIN
    UPDATE CO_CHUCVU
    SET
        MACHUCVU = p_new_machucvu,
        MACOQUAN = p_new_macoquan,
        MANGHENGHIEP = p_new_manghenghiep,
        THOIGIANGIUCHUCVU = p_start
    WHERE MAVIENCHUC = p_old_mavienchuc
      AND MACHUCVU = p_old_machucvu
      AND MACOQUAN = p_old_macoquan
      AND MANGHENGHIEP = p_old_manghenghiep;
END$$

DELIMITER ;

-- =========================================================
-- KHEN THUONG
-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_THEM_KHENTHUONG (
    IN p_mavienchuc CHAR(10),
    IN p_mahinhthuckhenthuong CHAR(5),
    IN p_nam DATETIME,
    IN p_soqd CHAR(50),
    IN p_nguoi_ky CHAR(150)
)
BEGIN
    INSERT INTO DUOC_KHENTHUONG (
        MAVIENCHUC,
        MAHINHTHUCKHENTHUONG,
        NAMNHANKHENTHUONG,
        SOQUYETDINHKHENTHUONG,
        NGUOIKYQUYETDINHKHENTHUONG
    )
    VALUES (
        p_mavienchuc,
        p_mahinhthuckhenthuong,
        p_nam,
        p_soqd,
        p_nguoi_ky
    );
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_LAY_KHENTHUONG (
    IN p_mavienchuc CHAR(10)
)
BEGIN
    SELECT 
        dk.MAHINHTHUCKHENTHUONG,
        htk.TENHINHTHUCKHENTHUONG,
        dk.NAMNHANKHENTHUONG,
        dk.SOQUYETDINHKHENTHUONG
    FROM DUOC_KHENTHUONG dk
    JOIN HINHTHUCKHENTHUONG htk 
        ON dk.MAHINHTHUCKHENTHUONG = htk.MAHINHTHUCKHENTHUONG
    WHERE dk.MAVIENCHUC = p_mavienchuc;
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_SUA_KHENTHUONG (
    IN p_old_mavienchuc CHAR(10),
    IN p_old_mahinhthuckhenthuong CHAR(5),

    IN p_new_mahinhthuckhenthuong CHAR(5),
    IN p_nam DATETIME,
    IN p_soqd CHAR(50),
    IN p_nguoi_ky CHAR(150)
)
BEGIN
    UPDATE DUOC_KHENTHUONG
    SET
        MAHINHTHUCKHENTHUONG = p_new_mahinhthuckhenthuong,
        NAMNHANKHENTHUONG = p_nam,
        SOQUYETDINHKHENTHUONG = p_soqd,
        NGUOIKYQUYETDINHKHENTHUONG = p_nguoi_ky
    WHERE MAVIENCHUC = p_old_mavienchuc
      AND MAHINHTHUCKHENTHUONG = p_old_mahinhthuckhenthuong;
END$$

DELIMITER ;

-- =========================================================
-- KY LUAT
-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_THEM_KYLUAT (
    IN p_mavienchuc CHAR(10),
    IN p_mahinhthuckyluat CHAR(5),
    IN p_nam DATETIME,
    IN p_soqd CHAR(50),
    IN p_nguoi_ky CHAR(150)
)
BEGIN
    INSERT INTO BI_KYLUAT (
        MAVIENCHUC,
        MAHINHTHUCKYLUAT,
        NAMBIKYLUAT,
        SOQUYETDINHKYLUAT,
        NGUOIKYQUYETDINHKYLUAT
    )
    VALUES (
        p_mavienchuc,
        p_mahinhthuckyluat,
        p_nam,
        p_soqd,
        p_nguoi_ky
    );
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_LAY_KYLUAT (
    IN p_mavienchuc CHAR(10)
)
BEGIN
    SELECT 
        bk.MAHINHTHUCKYLUAT,
        hkl.TENHINHTHUCKYLUAT,
        bk.NAMBIKYLUAT,
        bk.SOQUYETDINHKYLUAT
    FROM BI_KYLUAT bk
    JOIN HINHTHUCKYLUAT hkl
        ON bk.MAHINHTHUCKYLUAT = hkl.MAHINHTHUCKYLUAT
    WHERE bk.MAVIENCHUC = p_mavienchuc;
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_SUA_KYLUAT (
    IN p_old_mavienchuc CHAR(10),
    IN p_old_mahinhthuckyluat CHAR(5),

    IN p_new_mahinhthuckyluat CHAR(5),
    IN p_nam DATETIME,
    IN p_soqd CHAR(50),
    IN p_nguoi_ky CHAR(150)
)
BEGIN
    UPDATE BI_KYLUAT
    SET
        MAHINHTHUCKYLUAT = p_new_mahinhthuckyluat,
        NAMBIKYLUAT = p_nam,
        SOQUYETDINHKYLUAT = p_soqd,
        NGUOIKYQUYETDINHKYLUAT = p_nguoi_ky
    WHERE MAVIENCHUC = p_old_mavienchuc
      AND MAHINHTHUCKYLUAT = p_old_mahinhthuckyluat;
END$$

DELIMITER ;

-- =========================================================
-- HE SO LUONG
-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_THEM_HESOLUONG (
    IN p_mabac CHAR(5),
    IN p_manhom CHAR(4),
    IN p_machitiet CHAR(5),
    IN p_heso DECIMAL(5,3)
)
BEGIN
    INSERT INTO CO_HESOLUONG (
        MABACLUONG,
        MANHOMNGACH,
        MACHITIETLUONG,
        HESOLUONG
    )
    VALUES (
        p_mabac,
        p_manhom,
        p_machitiet,
        p_heso
    )
    ON DUPLICATE KEY UPDATE
        HESOLUONG = p_heso;
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_LAY_HESOLUONG (
    IN p_mabac CHAR(5),
    IN p_manhom CHAR(4),
    IN p_machitiet CHAR(5)
)
BEGIN
    SELECT HESOLUONG
    FROM CO_HESOLUONG
    WHERE MABACLUONG = p_mabac
      AND MANHOMNGACH = p_manhom
      AND MACHITIETLUONG = p_machitiet;
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_SUA_HESOLUONG (
    IN p_mabac CHAR(5),
    IN p_manhom CHAR(4),
    IN p_machitiet CHAR(5),
    IN p_heso DECIMAL(5,3)
)
BEGIN
    UPDATE CO_HESOLUONG
    SET HESOLUONG = p_heso
    WHERE MABACLUONG = p_mabac
      AND MANHOMNGACH = p_manhom
      AND MACHITIETLUONG = p_machitiet;
END$$

DELIMITER ;

-- =========================================================
-- TAM TRU
-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_THEM_TAMTRU (
    IN p_mavienchuc CHAR(10),
    IN p_maxaphuong CHAR(5),
    IN p_thoigiandangkytamtru DATETIME
)
BEGIN
    INSERT INTO CO_TAMTRU (
        MAVIENCHUC,
        MAXAPHUONG,
        THOIGIANDANGKYTAMTRU
    )
    VALUES (
        p_mavienchuc,
        p_maxaphuong,
        p_thoigiandangkytamtru
    );
END$$

DELIMITER ;

-- =========================================================

DELIMITER $$

CREATE PROCEDURE SP_LAY_TAMTRU (
    IN p_mavienchuc CHAR(10)
)
BEGIN
    SELECT 
        XP.TENXAPHUONG,
        TT.THOIGIANDANGKYTAMTRU
    FROM CO_TAMTRU TT
    JOIN XAPHUONG XP 
        ON TT.MAXAPHUONG = XP.MAXAPHUONG
    WHERE TT.MAVIENCHUC = p_mavienchuc;
END$$

DELIMITER ;