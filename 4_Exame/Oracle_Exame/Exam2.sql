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

INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH01', 'Trần Văn Tùng', '34 Hàng Bạc - Hoàn Kiếm - Hà Nội', '0913536674', 'tungtv@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH02', 'Nguyễn Thanh Tuấn', '101 Đại Cồ Việt - Hai Bà - Hà Nội', '01692016017', 'nttuan@yahoo.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH03', 'Phạm Thế Anh', 'Cổ Loa - Đông Anh - Hà Nội', '01226930001', 'anhthe80@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH04', 'Nguyễn Thị Phương Trà', '223 Bạch Mai - Hai Bà - Hà Nội', '0909123668', 'phuongtra_matnai@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH05', 'Lê Nhật Hoàng Giang', '469 Giải Phóng - Hoàng Mai - Hà Nội', '0934691616', 'nhatgiang_n1@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH06', 'Hoàng Diệu Linh', '38 Phố Huế - Hai Bà - Hà Nội', '0913536666', 'hnl_daigia@yahoo.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH07', 'Phan Ðang Trúc', '115 Nguyễn Trãi - Thanh Xuân - Hà Nội', '01231584158', 'phandangtruc@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH08', 'Hồ Hải Hậu', 'Phù Lỗ - Đông Anh - Hà Nội', '01229022001', 'bonghongxanh@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH09', 'Phạm Mạnh Hoàn', '195 Bạch Mai - Hai Bà - Hà Nội', '0901023668', 'hoanmp102@yahoo.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH10', 'Ngô Trúc Quân', '501 Giải Phóng - Hoàng Mai - Hà Nội', '0933344416', 'ngotrucquan.gp@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH11', 'Nguyễn Hữu Mạnh', '275 Phố Huế - Hai Bà - Hà Nội', '0913536618', 'manh_1284@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH12', 'Hoàng Mạnh Khang', '195 Mai Hắc Đế - Hai Bà - Hà Nội', '0913246789', 'khangmanhhoang@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH13', 'Lâm Minh Nhật', '101 Hàng Bài - Hoàn Kiếm - Hà Nội', '0978787868', 'lam_japan@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH14', 'Trương Mạnh Hùng', '19 Tôn Đức Thắng - Đống Đa - Hà Nội', '0908343566', 'truongmanh.hung@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH15', 'Nguyễn Tất Bình', '27 Lãn Ông - Hoàn Kiếm - Hà Nội', '0909001122', 'binhnt@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH16', 'Vũ Thanh Hiếu', '194 Xuân Thủy - Cầu Giấy - Hà Nội', '0909091234', 'vuhieu1979@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH17', 'Trần Giáng Hương', '54 Chùa Bộc - Đống Đa - Hà Nội', '01240001369', 'huong.tran.giang@yahoo.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH18', 'Nguyễn Minh Thông', '122 Đội Cấn - Ba Đình - Hà Nội', '0913572266', 'thongminh102@gmail.com');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH19', 'Hoàng Văn Đạt', 'P2501 - T10 Times City - Hai Bà - Hà Nội', '094321234', 'hoangvandat.timescity@gmailcom');
INSERT INTO KhachHang (makh, hoten, diachi, sdt, email) VALUES ('KH20', 'Nguyễn Trọng Quang', '91 Hàng Buồm - Hoàn Kiếm - Hà Nội', '0983691618', 'quang.fox@gmail.com');

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

INSERT INTO Kyhan (maK, kyhan, laisuat, chuky) VALUES ('TK0', 'Không kỳ hạn', 0.30, '1 Nam');
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

INSERT INTO ChiNhanh (maCN, tenCN, phuTrach) VALUES ('CN01', 'Hội sở chính', 'Nguyễn Ngọc Lan');
INSERT INTO ChiNhanh (maCN, tenCN, phuTrach) VALUES ('CN02', 'Chi nhánh Nam Hà N?i', 'Phan Thu Huệ');
INSERT INTO ChiNhanh (maCN, tenCN, phuTrach) VALUES ('CN03', 'Chi nhánh Thành Công', 'Trương Mạnh Hải');
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
-- tao view để lấy số lãi suất tính theo kỳ hạn (TK0 lãi suất tinh theo tháng)
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
  p_results OUT SYS.ODCIVARCHAR2LIST,
  p_Message OUT NVARCHAR2
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
    -- số tháng tính từ ngày gửi đến ngày hiện tại
    v_tongSoThang := ROUND(MONTHS_BETWEEN(SYSDATE, tk_record.ngaygui), 3);
    
    -- Số lần ky han đạt được theo kỳ hạn đã đăng ký
    v_soKyHan := CASE
                    WHEN tk_record.kyhan = 'TK0' THEN v_tongSoThang
                    ELSE ROUND(v_tongSoThang / TO_NUMBER(REGEXP_SUBSTR(tk_record.kyhan_t, '^\d+')), 0)
                  END;
    -- Số tháng lãi chưa đạt kỳ hạn 
    v_soThangDu := CASE
                    WHEN tk_record.kyhan = 'TK0' THEN 0
                    ELSE MOD(v_tongSoThang, TO_NUMBER(REGEXP_SUBSTR(tk_record.kyhan_t, '^\d+')))
                  END;
    --Số tiền ban đầu
    v_soTien := tk_record.sotien;

    -- Tính số tiền theo kỳ hạn gửi
    FOR i IN 1..v_soKyHan LOOP
      v_soTien := v_soTien * (1 + tk_record.laisuat_kh / 100);
    END LOOP; 

    -- Tính số tiền theo lãi suất TK0 cho số tháng dư
    v_soTien := ROUND(v_soTien * (1 + (tk_record.laisuat_kh / 100) * v_soThangDu), 0);

    -- Cộng dồn vào tổng số tiền
    p_tongSoTien := p_tongSoTien + v_soTien;

    p_results.EXTEND;
    p_results(p_results.COUNT) := 'Kỳ hạn: ' || v_soKyHan || ', Tháng dư: ' || v_soThangDu || ', Số tiền: ' || v_soTien;
  END LOOP;
  
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    p_Message:= 'No data found for customer ' || p_mak);
    p_tongSoTien := 0;
  WHEN OTHERS THEN
    p_Message:='Error: ' || SQLERRM;
    p_tongSoTien := 0;
END;

-- 4
CREATE OR REPLACE PROCEDURE TimkiemKhachHang(
    p_IdKhachHang IN khachhang.makh%TYPE DEFAULT NULL, 
    p_TenKhachHang IN khachhang.hoten%TYPE DEFAULT NULL, 
    p_SoDienThoai IN khachhang.sdt%TYPE DEFAULT NULL,
    p_cursor OUT SYS_REFCURSOR,
    p_Message OUT NVARCHAR2
)
IS 
BEGIN
    OPEN p_cursor FOR
        SELECT k.makh, k.hoten, t.maso, t.kyhan, c.tencn, c.phutrach, TO_CHAR(laisuat, '00.00') || '%' AS laisuat
        FROM khachhang k
        JOIN tietkiem t ON k.makh = t.makh
        JOIN chinhanh c ON t.noigi = c.macn
        JOIN kyhan h ON t.kyhan = h.mak
        WHERE (k.makh = p_IdKhachHang OR p_IdKhachHang IS NULL)
          AND (k.hoten = p_TenKhachHang OR p_TenKhachHang IS NULL)
          AND (k.sdt = p_SoDienThoai OR p_SoDienThoai IS NULL);
    
    IF p_cursor%FOUND THEN
        p_Message := 'Data retrieved successfully.';
    ELSE
        p_Message := 'No data found.';
    END IF;
    
EXCEPTION
  WHEN OTHERS THEN
    p_Message := 'Error: ' || SQLERRM;
END;






