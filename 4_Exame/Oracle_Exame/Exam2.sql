--1
-- 
create table KhachHang (
    makh        varchar2(10),
    hoten       nvarchar2(25),
    diachi      nvarchar2(255),
    sdt         varchar2(11),
    email       varchar2(30),
    phanloai    varchar2(5)
);
after table KhachHang
add constraint pk_KhachH_maKH PRIMARY KEY (makh);

INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH01', 'Tr?n Van Tùng', '34 Hàng B?c - Hoàn Ki?m - Hà N?i', '0913536674', 'tungtv@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH02', 'Nguy?n Thanh Tu?n', '101 Ð?i C? Vi?t - Hai Bà - Hà N?i', '01692016017', 'nttuan@yahoo.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH03', 'Ph?m Th? Anh', 'C? Loa - Ðông Anh - Hà N?i', '01226930001', 'anhthe80@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH04', 'Nguy?n Th? Phuong Trà', '223 B?ch Mai - Hai Bà - Hà N?i', '0909123668', 'phuongtra_matnai@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH05', 'Lê Nh?t Hoàng Giang', '469 Gi?i Phóng - Hoàng Mai - Hà N?i', '0934691616', 'nhatgiang_n1@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH06', 'Hoàng Di?u Linh', '38 Ph? Hu? - Hai Bà - Hà N?i', '0913536666', 'hnl_daigia@yahoo.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH07', 'Phan Ðang Trúc', '115 Nguy?n Trãi - Thanh Xuân - Hà N?i', '01231584158', 'phandangtruc@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH08', 'H? H?i H?u', 'Phù L? - Ðông Anh - Hà N?i', '01229022001', 'bonghongxanh@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH09', 'Ph?m M?nh Hoàn', '195 B?ch Mai - Hai Bà - Hà N?i', '0901023668', 'hoanmp102@yahoo.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH10', 'Ngô Trúc Quân', '501 Gi?i Phóng - Hoàng Mai - Hà N?i', '0933344416', 'ngotrucquan.gp@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH11', 'Nguy?n H?u M?nh', '275 Ph? Hu? - Hai Bà - Hà N?i', '0913536618', 'manh_1284@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH12', 'Hoàng M?nh Khang', '195 Mai H?c Ð? - Hai Bà - Hà N?i', '0913246789', 'khangmanhhoang@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH13', 'Lâm Minh Nh?t', '101 Hàng Bài - Hoàn Ki?m - Hà N?i', '0978787868', 'lam_japan@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH14', 'Truong M?nh Hùng', '19 Tôn Ð?c Th?ng - Ð?ng Ða - Hà N?i', '0908343566', 'truongmanh.hung@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH15', 'Nguy?n T?t Bình', '27 Lãn Ông - Hoàn Ki?m - Hà N?i', '0909001122', 'binhnt@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH16', 'Vu Thanh Hi?u', '194 Xuân Th?y - C?u Gi?y - Hà N?i', '0909091234', 'vuhieu1979@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH17', 'Tr?n Giáng Huong', '54 Chùa B?c - Ð?ng Ða - Hà N?i', '01240001369', 'huong.tran.giang@yahoo.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH18', 'Nguy?n Minh Thông', '122 Ð?i C?n - Ba Ðình - Hà N?i', '0913572266', 'thongminh102@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH19', 'Hoàng Van Ð?t', 'P2501 - T10 Times City - Hai Bà - Hà N?i', '094321234', 'hoangvandat.timescity@gmailcom');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH20', 'Nguy?n Tr?ng Quang', '91 Hàng Bu?m - Hoàn Ki?m - Hà N?i', '0983691618', 'quang.fox@gmail.com');

commit;

--
create table Kyhan(
    maK     varchar2(10),
    kyhan   nvarchar2(20),
    laisuat number(5,2),
    chuky   varchar2(10)
);

after table kyhan
add constraint pk_KyH_maK PRIMARY KEY (mak);

INSERT INTO Kyhan (maK, kyhan, laisuat, chuky) VALUES ('TK0', 'Không k? h?n', 0.30, '1 Nam');
INSERT INTO Kyhan (maK, kyhan, laisuat, chuky) VALUES ('TK1', '01 tháng', 4.50, '1 Nam');
INSERT INTO Kyhan (maK, kyhan, laisuat, chuky) VALUES ('TK3', '03 tháng', 5.00, '1 Nam');
INSERT INTO Kyhan (maK, kyhan, laisuat, chuky) VALUES ('TK6', '06 tháng', 5.40, '1 Nam');
INSERT INTO Kyhan (maK, kyhan, laisuat, chuky) VALUES ('TK12', '12 tháng', 6.30, '1 Nam');
INSERT INTO Kyhan (maK, kyhan, laisuat, chuky) VALUES ('TK24', '24 tháng', 13.50, '2 Nam');
INSERT INTO Kyhan (maK, kyhan, laisuat, chuky) VALUES ('TK36', '36 tháng', 20.00, '3 Nam');
commit;

--
create table ChiNhanh (
    maCN        varchar2(10),
    tenCN       nvarchar2(20),
    phuTrach    nvarchar2(20)
)
after table chinhanh
add constraint pk_ChiN_maCn PRIMARY KEY (macn);

INSERT INTO ChiNhanh (maCN, tenCN, phuTrach) VALUES ('CN01', 'H?i s? chính', 'Nguy?n Ng?c Lan');
INSERT INTO ChiNhanh (maCN, tenCN, phuTrach) VALUES ('CN02', 'Chi nhánh Nam Hà N?i', 'Phan Thu Hu?');
INSERT INTO ChiNhanh (maCN, tenCN, phuTrach) VALUES ('CN03', 'Chi nhánh Thành Công', 'Truong M?nh H?i');
INSERT INTO ChiNhanh (maCN, tenCN, phuTrach) VALUES ('CN04', 'Chi nhánh Hoàn Ki?m', 'Tô Thanh Long');
INSERT INTO ChiNhanh (maCN, tenCN, phuTrach) VALUES ('CN05', 'Chi nhánh Tây H?', 'Mai Phúc Thành');
commit;

--
create table Tietkiem (
    maso        varchar2(10),
    makh        varchar2(10),
    noigi       varchar2(10),
    sotien      number(20, 2),
    kyhan       varchar2(5),
    ngaygui     date,
    ngayrut     date,
    sotiennhan  number(15, 2)
);
after table tietkiem
add constraint pk_TietK_maSo PRIMARY KEY (maSo);

after table Tietkiem
add constraint fk_TietK_makh FOREIGN KEY (makh) REFERENCES Khachhang(makh);

after table Tietkiem
add constraint fk_TietK_noigi FOREIGN KEY (noigi) REFERENCES Chinhanh(macn);

after table Tietkiem
add constraint fk_TietK_kyhan FOREIGN KEY (kyhan) REFERENCES Kyhan(maK);

INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S01', 'KH01', 'CN02', 1050000000.00, 'TK0', TO_DATE('10/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S02', 'KH02', 'CN02', 850000000.00, 'TK1', TO_DATE('11/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S03', 'KH03', 'CN01', 1350000000.00, 'TK3', TO_DATE('12/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S04', 'KH04', 'CN02', 670000000.00, 'TK6', TO_DATE('13/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S05', 'KH05', 'CN03', 1210000000.00, 'TK3', TO_DATE('14/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S06', 'KH06', 'CN04', 3010000000.00, 'TK6', TO_DATE('14/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S07', 'KH15', 'CN05', 2420000000.00, 'TK12', TO_DATE('14/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S08', 'KH16', 'CN02', 400000000.00, 'TK24', TO_DATE('14/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S09', 'KH17', 'CN03', 1890000000.00, 'TK36', TO_DATE('14/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S10', 'KH18', 'CN02', 1320000000.00, 'TK1', TO_DATE('14/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S11', 'KH19', 'CN01', 350000000.00, 'TK3', TO_DATE('14/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S12', 'KH20', 'CN01', 730000000.00, 'TK6', TO_DATE('14/10/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S13', 'KH04', 'CN01', 1620000000.00, 'TK3', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S14', 'KH05', 'CN01', 2040000000.00, 'TK6', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S15', 'KH06', 'CN03', 1250000000.00, 'TK12', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S16', 'KH07', 'CN03', 1830000000.00, 'TK3', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S17', 'KH08', 'CN01', 1350000000.00, 'TK6', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S18', 'KH09', 'CN02', 670000000.00, 'TK12', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S19', 'KH10', 'CN03', 1210000000.00, 'TK24', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S20', 'KH11', 'CN04', 3010000000.00, 'TK36', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S21', 'KH12', 'CN05', 2420000000.00, 'TK1', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S22', 'KH13', 'CN02', 400000000.00, 'TK3', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S23', 'KH14', 'CN01', 1890000000.00, 'TK1', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S24', 'KH15', 'CN01', 1320000000.00, 'TK3', TO_DATE('15/12/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S25', 'KH16', 'CN03', 350000000.00, 'TK6', TO_DATE('15/12/2018', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S26', 'KH05', 'CN03', 1320000000.00, 'TK3', TO_DATE('20/01/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S27', 'KH06', 'CN03', 350000000.00, 'TK6', TO_DATE('20/01/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S28', 'KH15', 'CN03', 730000000.00, 'TK12', TO_DATE('20/01/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S29', 'KH16', 'CN01', 1620000000.00, 'TK3', TO_DATE('20/01/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S30', 'KH17', 'CN01', 2040000000.00, 'TK6', TO_DATE('20/01/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S31', 'KH18', 'CN01', 1250000000.00, 'TK12', TO_DATE('20/01/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S32', 'KH19', 'CN01', 1830000000.00, 'TK24', TO_DATE('20/01/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S33', 'KH20', 'CN01', 1350000000.00, 'TK6', TO_DATE('20/01/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S34', 'KH04', 'CN03', 670000000.00, 'TK3', TO_DATE('09/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S35', 'KH05', 'CN04', 1210000000.00, 'TK6', TO_DATE('09/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S36', 'KH06', 'CN05', 3010000000.00, 'TK12', TO_DATE('09/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S37', 'KH07', 'CN05', 1210000000.00, 'TK3', TO_DATE('09/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S38', 'KH08', 'CN05', 3010000000.00, 'TK6', TO_DATE('09/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S39', 'KH09', 'CN05', 2420000000.00, 'TK12', TO_DATE('09/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S40', 'KH17', 'CN04', 400000000.00, 'TK24', TO_DATE('09/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S41', 'KH07', 'CN04', 1890000000.00, 'TK36', TO_DATE('20/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S42', 'KH14', 'CN04', 1320000000.00, 'TK1', TO_DATE('20/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S43', 'KH17', 'CN02', 350000000.00, 'TK3', TO_DATE('20/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S44', 'KH04', 'CN02', 1320000000.00, 'TK1', TO_DATE('21/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S45', 'KH01', 'CN02', 350000000.00, 'TK3', TO_DATE('25/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S46', 'KH05', 'CN02', 730000000.00, 'TK6', TO_DATE('25/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S47', 'KH08', 'CN02', 1620000000.00, 'TK3', TO_DATE('25/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S48', 'KH16', 'CN03', 2040000000.00, 'TK0', TO_DATE('25/02/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S49', 'KH05', 'CN04', 3010000000.00, 'TK1', TO_DATE('08/03/2019', 'DD/MM/YYYY'));
INSERT INTO Tietkiem (maso, makh, noigi, sotien, kyhan, ngaygui) VALUES ('S50', 'KH10', 'CN05', 400000000.00, 'TK0', TO_DATE('08/03/2019', 'DD/MM/YYYY'));

commit;

--2
select makh, sum(sotien) as TongTien,CASE
               WHEN SUM(sotien) < 5000000000 THEN 'C'
               WHEN SUM(sotien) BETWEEN 5000000000 AND 10000000000 THEN 'B'
               WHEN SUM(sotien) >= 10000000000 THEN 'A'
           END
from tietkiem t
group by makh;

update khachhang
SET phanloai = (
                select CASE
                           WHEN SUM(sotien) < 5000000000 THEN 'C'
                           WHEN SUM(sotien) BETWEEN 5000000000 AND 10000000000 THEN 'B'
                           WHEN SUM(sotien) >= 10000000000 THEN 'A'
                       END
                from tietkiem t
                where t.makh = khachhang.makh
                group by makh            
);
commit;
--3
-- t?o view d? l?y s? lãi su?t tính theo k? h?n (TK0 lãi su?t tinh theo tháng)
create view v_kyhan_laisuatKh
as
select k.mak,k.kyhan,CASE 
                       WHEN  REGEXP_SUBSTR(k.kyhan, '^\d+') IS NULL 
                       THEN  k.laisuat/12
                       ELSE  ROUND((TO_NUMBER(REGEXP_SUBSTR(k.kyhan, '^\d+'))/(TO_NUMBER(REGEXP_SUBSTR(k.chuky, '^\d+')*12))*(k.laisuat),3) 
                     END AS  laisuat_kh
from kyhan k;
commit;

-- 
CREATE OR REPLACE PROCEDURE TinhTongSoTienRut (
  p_makh IN VARCHAR2, 
  p_tongSoTien OUT NUMBER,
  p_results OUT SYS.ODCIVARCHAR2LIST
) 
IS
  CURSOR cr_tk IS
    SELECT t.maso, t.makh, t.noigi, t.sotien, t.kyhan, t.ngaygui, t.ngayrut,
           t.sotiennhan, v.kyhan AS kyhan_t, v.laisuat_kh
    FROM tietkiem t, v_kyhan_laisuatkh v 
    WHERE t.makh = p_makh AND t.kyhan = v.mak;
  
  v_tongSoThang NUMBER;
  v_soTien NUMBER;
  v_soKyHan NUMBER;
  v_soThangDu NUMBER;
  
BEGIN
  p_tongSoTien := 0;
  
  FOR tk_record IN cr_tk LOOP 
    -- s? tháng tính t? ngày g?i d?n ngày hi?n t?i
    v_tongSoThang := ROUND(MONTHS_BETWEEN(SYSDATE, tk_record.ngaygui), 3);
    DBMS_OUTPUT.PUT_LINE('So tháng: ' || v_tongSoThang);
    
    -- S? l?n k? h?n d?t du?c theo k? h?n dã dang ký
    v_soKyHan := CASE
                    WHEN tk_record.kyhan = 'TK0' THEN v_tongSoThang
                    ELSE ROUND(v_tongSoThang / TO_NUMBER(REGEXP_SUBSTR(tk_record.kyhan_t, '^\d+')), 0)
                  END;
    -- S? tháng l? chua d?t k? h?n 
    v_soThangDu := CASE
                    WHEN tk_record.kyhan = 'TK0' THEN 0
                    ELSE MOD(v_tongSoThang, TO_NUMBER(REGEXP_SUBSTR(tk_record.kyhan_t, '^\d+')))
                  END;
    --S? ti?n ban d?u
    v_soTien := tk_record.sotien;

    -- Tính s? ti?n theo k? h?n g?i
    FOR i IN 1..v_soKyHan LOOP
      v_soTien := v_soTien * (1 + tk_record.laisuat_kh / 100);
    END LOOP; 

    -- Tính s? ti?n theo lãi su?t TK0 cho s? tháng du
    v_soTien := ROUND(v_soTien * (1 + (tk_record.laisuat_kh / 100) * v_soThangDu), 0);

    -- C?ng d?n vào t?ng s? ti?n
    p_tongSoTien := p_tongSoTien + v_soTien;

    p_results.EXTEND;
    p_results(p_results.COUNT) := 'K? h?n: ' || v_soKyHan || ', Tháng du: ' || v_soThangDu || ', S? ti?n: ' || v_soTien;
  END LOOP;
  
  OPEN p_cursor FOR 
    SELECT COLUMN_VALUE AS details FROM TABLE(v_results);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No data found for customer ' || p_makh);
    p_tongSoTien := 0;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    p_tongSoTien := 0;
END;

-- 4
CREATE OR REPLACE PROCEDURE TimkiemKhachHang(
    p_IdKhachHang IN khachhang.makh%TYPE DEFAULT NULL, 
    p_TenKhachHang IN khachhang.hoten%TYPE DEFAULT NULL, 
    p_SoDienThoai IN khachhang.sdt%TYPE DEFAULT NULL
)
IS 
BEGIN
    -- Dòng tiêu d?
    DBMS_OUTPUT.PUT_LINE(RPAD('Mã khách hàng', 20) || RPAD('Tên khách hàng', 30) || RPAD('Mã s? TK', 15) || RPAD('K? h?n', 10) || RPAD('Tên chi nhánh', 25) || RPAD('Ph? trách CN', 20) || 'Lãi su?t');
    FOR kh_record IN(
        SELECT k.makh,k.hoten,t.maso,t.kyhan,c.tencn,c.phutrach,TO_CHAR(laisuat,'00.00') || '%' as laisuat
        FROM    khachhang k,chinhanh c, kyhan h,tietkiem t
        WHERE   k.makh=t.makh 
                AND t.noigi=c.macn
                AND t.kyhan=h.mak
                AND (k.makh = p_IdKhachHang OR p_IdKhachHang IS NULL)
                AND (k.hoten = p_TenKhachHang OR p_TenKhachHang IS NULL)
                AND (k.sdt = p_SoDienThoai OR p_SoDienThoai IS NULL)
    )
    LOOP 
    -- Dòng d? li?u
    DBMS_OUTPUT.PUT_LINE(RPAD(kh_record.makh, 20) || RPAD(kh_record.hoten, 30) || RPAD(kh_record.maso, 15) || RPAD(kh_record.kyhan, 10) || RPAD(kh_record.tencn, 25) || RPAD(kh_record.phutrach, 20) || kh_record.laisuat);    END LOOP;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END; 

exec TimkiemKhachHang('KH01');




