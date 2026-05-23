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
    LEFT JOIN DANTOC dt ON vc.MADANTOC = dt.MADANTOC
    LEFT JOIN TONGIAO tg ON vc.MATONGIAO = tg.MATONGIAO
    LEFT JOIN TRINHDOHOCVAN td ON vc.MATRINHDO = td.MATRINHDO
    LEFT JOIN HOCHAM hh ON vc.MAHOCHAM = hh.MAHOCHAM
    LEFT JOIN DANHHIEU dd ON vc.MADANHHIEU = dd.MADANHHIEU
    WHERE vc.MAVIENCHUC = p_MAVIENCHUC;
END$$

DELIMITER ;


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
        MAVIENCHUC, HO, TENLOT, TEN,
        NGAYSINH, GIOITINH,
        MADANTOC, MATRINHDO, MAXAPHUONG, XAP_MAXAPHUONG
    )
    VALUES (
        p_mavienchuc, p_ho, p_tenlot, p_ten,
        p_ngaysinh, p_gioitinh,
        p_madantoc, p_matrinhdo, p_maxaphuong, p_maxaphuong
    );
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE SP_THEM_CHUCVU_VIENCHUC (
    IN p_mavienchuc CHAR(10),
    IN p_machucvu CHAR(5),
    IN p_macoquan CHAR(5),
    IN p_manghenghiep CHAR(5),
    IN p_start DATETIME
)
BEGIN
    INSERT INTO CO_CHUCVU (
        MAVIENCHUC, MACHUCVU, MACOQUAN, MANGHENGHIEP,
        THOIGIANGIUCHUCVU
    )
    VALUES (
        p_mavienchuc, p_machucvu, p_macoquan, p_manghenghiep,
        p_start
    );
END$$

DELIMITER ;



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