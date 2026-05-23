CREATE PROCEDURE SP_LAY_THONGTIN_VIENCHUC
    @p_MAVIENCHUC CHAR(10)
AS
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
   WHERE vc.MAVIENCHUC = @p_MAVIENCHUC;
END


CREATE PROCEDURE SP_THEM_VIENCHUC
    @p_mavienchuc CHAR(10),
    @p_ho VARCHAR(20),
    @p_tenlot VARCHAR(40),
    @p_ten VARCHAR(20),
    @p_ngaysinh DATETIME,
    @p_gioitinh VARCHAR(3),
    @p_madantoc CHAR(5),
    @p_matrinhdo CHAR(5),
    @p_maxaphuong CHAR(5)
AS
BEGIN
   INSERT INTO VIENCHUC (
      MAVIENCHUC, HO, TENLOT, TEN,
      NGAYSINH, GIOITINH,
      MADANTOC, MATRINHDO, MAXAPHUONG, XAP_MAXAPHUONG
   )
   VALUES (
      @p_mavienchuc, @p_ho, @p_tenlot, @p_ten,
      @p_ngaysinh, @p_gioitinh,
      @p_madantoc, @p_matrinhdo, @p_maxaphuong, @p_maxaphuong
   );
END