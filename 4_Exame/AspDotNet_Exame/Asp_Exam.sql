create table tfu_parafeevsd(
    aparafeeid      timestamp(9) NOT NULL, --id
    afeeposition    number(13,0) NOT NULL, --biểu phí 
    astatus         number(1,0),-- tình trạng 0-chờ duyệt, 1-chờ kích hoạt, 2- hiệu lực,-2 hết hiệu lực 
    acreateby       varchar2(20 char),--người tạo
    acreatedte      date,-- ngày tạo
    aapprovedby     varchar2(20 char),--người duyệt
    aapproveddte    date,-- ngày duyệt
    aactivedte      date-- ngày hiệu lực
);

INSERT INTO tfu_parafeevsd (aparafeeid, afeeposition, astatus, acreateby, acreatedte, aapprovedby, aapproveddte, aactivedte)
VALUES (TIMESTAMP '2024-10-22 10:00:00', 10001, 0, 'user1', TO_DATE('2024-10-20', 'YYYY-MM-DD'), NULL, NULL, NULL);

INSERT INTO tfu_parafeevsd (aparafeeid, afeeposition, astatus, acreateby, acreatedte, aapprovedby, aapproveddte, aactivedte)
VALUES (TIMESTAMP '2024-10-22 10:05:00', 10002, 1, 'user2', TO_DATE('2024-10-21', 'YYYY-MM-DD'), 'admin1', TO_DATE('2024-10-22', 'YYYY-MM-DD'), NULL);

INSERT INTO tfu_parafeevsd (aparafeeid, afeeposition, astatus, acreateby, acreatedte, aapprovedby, aapproveddte, aactivedte)
VALUES (TIMESTAMP '2024-10-22 10:10:00', 10003, 2, 'user3', TO_DATE('2024-10-19', 'YYYY-MM-DD'), 'admin2', TO_DATE('2024-10-21', 'YYYY-MM-DD'), TO_DATE('2024-10-22', 'YYYY-MM-DD'));

INSERT INTO tfu_parafeevsd (aparafeeid, afeeposition, astatus, acreateby, acreatedte, aapprovedby, aapproveddte, aactivedte)
VALUES (TIMESTAMP '2024-10-22 10:15:00', 10004, -2, 'user4', TO_DATE('2024-10-18', 'YYYY-MM-DD'), 'admin3', TO_DATE('2024-10-20', 'YYYY-MM-DD'), TO_DATE('2024-10-21', 'YYYY-MM-DD'));

INSERT INTO tfu_parafeevsd (aparafeeid, afeeposition, astatus, acreateby, acreatedte, aapprovedby, aapproveddte, aactivedte)
VALUES (TIMESTAMP '2024-10-22 10:20:00', 10005, 0, 'user5', TO_DATE('2024-10-22', 'YYYY-MM-DD'), NULL, NULL, NULL);

commit;

CREATE OR REPLACE PROCEDURE sp_GetAllParafeevsd ( p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_cursor FOR
    SELECT 
        k.afeeposition,
        k.aactivedte,
        k.aapproveddte,
        CASE 
            WHEN k.astatus = 0 THEN 'Chờ duyệt'
            WHEN k.astatus = 1 THEN 'Chờ kích hoạt'
            WHEN k.astatus = 2 THEN 'Hiệu lực'
            WHEN k.astatus = -2 THEN 'Hết hiệu lực'
        END AS astatus,
        k.acreateby,
        TO_CHAR(k.aparafeeid, 'DD-MON-YYYY HH24:MI:SS.FF9') AS aparafeeid
    FROM tfu_parafeevsd k
    ORDER BY k.aparafeeid;
END;

CREATE OR REPLACE PROCEDURE sp_SelectParafeevsd (
    p_afeeposition  IN tfu_parafeevsd.afeeposition%TYPE DEFAULT NULL,
    p_astatus       IN tfu_parafeevsd.astatus%TYPE DEFAULT NULL,
    p_aactivedte    IN tfu_parafeevsd.aactivedte%TYPE DEFAULT NULL,
    p_cursor        OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_cursor FOR
    SELECT 
        k.afeeposition,
        k.aactivedte,
        k.aapproveddte,
        CASE 
            WHEN k.astatus = 0 THEN 'Chờ duyệt'
            WHEN k.astatus = 1 THEN 'Chờ kích hoạt'
            WHEN k.astatus = 2 THEN 'Hiệu lực'
            WHEN k.astatus = -2 THEN 'Hết hiệu lực'
        END AS astatus,
        k.acreateby,
        TO_CHAR(aparafeeid, 'DD-MON-YYYY HH24:MI:SS.FF9') AS aparafeeid
    FROM tfu_parafeevsd k
    WHERE   (k.afeeposition <= p_afeeposition OR p_afeeposition IS NULL)
            AND (k.astatus = p_astatus OR p_astatus IS NULL)
            AND (k.aactivedte = p_aactivedte OR p_aactivedte IS NULL)
    ORDER BY k.acreatedte;

END;

CREATE OR REPLACE PROCEDURE sp_InsertParafeeVSD(
    p_aparafeeid    IN TIMESTAMP,
    p_afeeposition  IN NUMBER,
    p_astatus       IN NUMBER,
    p_acreateby     IN VARCHAR2,
    p_acreatedte    IN DATE,
    p_aapprovedby   IN VARCHAR2,
    p_aapproveddte  IN DATE,
    p_aactivedte    IN DATE
)
AS
BEGIN
    INSERT INTO tfu_parafeevsd (
        aparafeeid, afeeposition, astatus, acreateby,acreatedte, aapprovedby, aapproveddte, aactivedte
    ) VALUES (
        p_aparafeeid, p_afeeposition, p_astatus, p_acreateby,p_acreatedte, p_aapprovedby, p_aapproveddte, p_aactivedte
    );
    COMMIT;
END;

-- tự đông đổi trạng thái
CREATE OR REPLACE PROCEDURE UpdateParafeeStatus 
IS
BEGIN
    UPDATE tfu_parafeevsd
    SET astatus = 2 
    WHERE astatus = 1 
      AND aactivedte = TRUNC(SYSDATE) + 1;
      
    UPDATE tfu_parafeevsd
    SET astatus = -2 
    WHERE astatus = 2;
     
    COMMIT; 
END;


BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'UpdateParafeeStatusJob',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN UpdateParafeeStatus; END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval  => 'FREQ=DAILY; BYHOUR=18; BYMINUTE=0; BYSECOND=0', 
        enabled         => TRUE
    );
END;

-- duyệt 
CREATE OR REPLACE PROCEDURE BrowseParafee( 
    p_aparafeeid IN VARCHAR2,
    p_error OUT NVARCHAR2)
IS 
    v_id TIMESTAMP(9);
BEGIN
    
    v_id := TO_TIMESTAMP(p_aparafeeid, 'DD-MON-YYYY HH24:MI:SS.FF9 AM');

    UPDATE tfu_parafeevsd
    SET astatus = 1, aapproveddte = SYSDATE
    WHERE astatus = 0
          AND aparafeeid = v_id;

    -- Xử lý ngoại lệ
EXCEPTION
    WHEN OTHERS THEN
        p_error := 'Error: ' || SQLERRM;
END;

-- Exam2
create table tfu_feeposition(
    atransdte       date,-- Ngày tính phí 
    aclientcode     varchar2(10 char),-- số tài khoản
    aquantuty       number(13,0) default 0,-- số luợng vị thế cuối ngày
    afeeposition    number(13,0) default 0,-- biểu phí qlvt
    avalue          number(13,0) default 0,-- phí qlvt
    astatus         number(1,0),-- tình trạng 1- chưa thu, 2- dã thu
    acreateby       varchar2(20 char),-- người tạo
    acreatedte      date-- ngày tạo
);

INSERT INTO tfu_feeposition (atransdte, aclientcode, aquantuty, afeeposition, avalue, astatus, acreateby, acreatedte)
VALUES (TO_DATE('2024-10-02', 'YYYY-MM-DD'), '058C000001', 1000, 200, 200000, 1, 'user1', TO_DATE('2024-10-02', 'YYYY-MM-DD'));

INSERT INTO tfu_feeposition (atransdte, aclientcode, aquantuty, afeeposition, avalue, astatus, acreateby, acreatedte)
VALUES (TO_DATE('2024-10-03', 'YYYY-MM-DD'), '058C000002', 1500, 250, 375000, 1, 'user2', TO_DATE('2024-10-03', 'YYYY-MM-DD'));

INSERT INTO tfu_feeposition (atransdte, aclientcode, aquantuty, afeeposition, avalue, astatus, acreateby, acreatedte)
VALUES (TO_DATE('2024-10-13', 'YYYY-MM-DD'), '058C000005', 1200, 220, 264000, 2, 'user3', TO_DATE('2024-10-11', 'YYYY-MM-DD'));

INSERT INTO tfu_feeposition (atransdte, aclientcode, aquantuty, afeeposition, avalue, astatus, acreateby, acreatedte)
VALUES (TO_DATE('2024-10-21', 'YYYY-MM-DD'), '058C000001', 1800, 300, 540000, 1, 'user4', TO_DATE('2024-10-21', 'YYYY-MM-DD'));

INSERT INTO tfu_feeposition (atransdte, aclientcode, aquantuty, afeeposition, avalue, astatus, acreateby, acreatedte)
VALUES (TO_DATE('2024-10-21', 'YYYY-MM-DD'), '058C000003', 2000, 400, 800000, 2, 'user5', TO_DATE('2024-10-21', 'YYYY-MM-DD'));

INSERT INTO tfu_feeposition (atransdte, aclientcode, aquantuty, afeeposition, avalue, astatus, acreateby, acreatedte)
VALUES (TO_DATE('2024-11-01', 'YYYY-MM-DD'), '058C000002', 1100, 200, 220000, 1, 'user7', TO_DATE('2024-11-01', 'YYYY-MM-DD'));

INSERT INTO tfu_feeposition (atransdte, aclientcode, aquantuty, afeeposition, avalue, astatus, acreateby, acreatedte)
VALUES (TO_DATE('2024-11-05', 'YYYY-MM-DD'), '058C000004', 1300, 300, 390000, 1, 'user8', TO_DATE('2024-11-05', 'YYYY-MM-DD'));

INSERT INTO tfu_feeposition (atransdte, aclientcode, aquantuty, afeeposition, avalue, astatus, acreateby, acreatedte)
VALUES (TO_DATE('2024-11-10', 'YYYY-MM-DD'), '058C000003', 1400, 250, 350000, 2, 'user9', TO_DATE('2024-11-10', 'YYYY-MM-DD'));

INSERT INTO tfu_feeposition (atransdte, aclientcode, aquantuty, afeeposition, avalue, astatus, acreateby, acreatedte)
VALUES (TO_DATE('2024-11-10', 'YYYY-MM-DD'), '058P300113', 1400, 250, 350000, 2, 'user9', TO_DATE('2024-11-10', 'YYYY-MM-DD'));

commit;

--
create table tfu_customerinfo(
    atblid          number(12,0),-- id khách hàng
    aname           varchar2(500 char),-- tên khách hàng
    asex            number(1,0),-- giới tính 
    aadress         varchar2(200 char),-- địa chỉ
    aphone          varchar2(50 char),-- số điện thoại
    aemail          varchar2(50 char),-- địa chỉ email
    acustaccount    varchar2(10 char),--số tài khoản
    acostcenter     number NOT NULL,-- chi nhánh tạo tài khoản:HN-1,DN-2, HCM-3
    acusttype       number NOT NULL,-- loai khách hàng: CNTN-1, CNNN-2, TCTN-3, TCNN-4
    acreatedate     date,-- ngày tạo
    amodifydate     date-- ngày sửa
);

INSERT INTO tfu_customerinfo (atblid, aname, asex, aadress, aphone, aemail, acustaccount, acostcenter, acusttype, acreatedate, amodifydate)
VALUES (1, 'Nguyễn Van A', 1, '123 Ðường ABC, TP. HCM', '0909123456', 'nguyenvana@example.com', '058C000001', 1, 1, TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-05', 'YYYY-MM-DD'));

INSERT INTO tfu_customerinfo (atblid, aname, asex, aadress, aphone, aemail, acustaccount, acostcenter, acusttype, acreatedate, amodifydate)
VALUES (2, 'Trần Thị B', 0, '456 Ðường DEF, Hà Nội', '0987654321', 'tranthib@example.com', '058C000002', 2, 2, TO_DATE('2024-09-25', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'));

INSERT INTO tfu_customerinfo (atblid, aname, asex, aadress, aphone, aemail, acustaccount, acostcenter, acusttype, acreatedate, amodifydate)
VALUES (3, 'Lê Văn C', 1, '789 Ðường GHI, Ðà Nẵng', '0911222333', 'levanc@example.com', '058C000003', 3, 1, TO_DATE('2024-10-10', 'YYYY-MM-DD'), TO_DATE('2024-10-12', 'YYYY-MM-DD'));

INSERT INTO tfu_customerinfo (atblid, aname, asex, aadress, aphone, aemail, acustaccount, acostcenter, acusttype, acreatedate, amodifydate)
VALUES (4, 'Phạm Thị D', 0, '321 Ðường JKL, Cần Tho', '0933444555', 'phamthid@example.com', '058C000004', 1, 3, TO_DATE('2024-09-15', 'YYYY-MM-DD'), TO_DATE('2024-09-20', 'YYYY-MM-DD'));

INSERT INTO tfu_customerinfo (atblid, aname, asex, aadress, aphone, aemail, acustaccount, acostcenter, acusttype, acreatedate, amodifydate)
VALUES (5, 'Hoàng Văn E', 1, '654 Ðường MNO, Hải Phòng', '0977666777', 'hoangvane@example.com', '058C000005', 2, 4, TO_DATE('2024-10-05', 'YYYY-MM-DD'), TO_DATE('2024-10-08', 'YYYY-MM-DD'));

INSERT INTO tfu_customerinfo (atblid, aname, asex, aadress, aphone, aemail, acustaccount, acostcenter, acusttype, acreatedate, amodifydate)
VALUES (6, 'Pham Anh Z', 1, '654 Ðường MNO, Hải Phòng', '0924341211', 'phamanhz@example.com', '058P300113', 3, 1, TO_DATE('2024-11-05', 'YYYY-MM-DD'), TO_DATE('2024-11-08', 'YYYY-MM-DD'));
commit;

CREATE OR REPLACE PROCEDURE p_GetAllCustomerInfo(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_cursor FOR
        SELECT 
            atblid,aname,asex,aadress,aphone,aemail,acustaccount,acostcenter,acusttype,acreatedate,amodifydate
        FROM 
            tfu_customerinfo;
END;

CREATE OR REPLACE PROCEDURE p_GetAllFeePosition(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_cursor FOR
        SELECT 
            TO_CHAR(atransdte, 'DD/MM/YYYY') as atransdte,aclientcode,aquantuty,afeeposition,avalue,astatus,acreateby,TO_CHAR(acreatedte, 'DD/MM/YYYY') as acreatedte
        FROM 
            tfu_feeposition f
        ORDER BY f.atransdte;
END;


CREATE OR REPLACE PROCEDURE p_GetReportFeePosition(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_cursor FOR
        SELECT 
            'Tổng tháng ' || TO_CHAR(atransdte, 'MM/YYYY') AS month_year,
            SUM(aquantuty) AS sumAquantuty,
            SUM(afeeposition) AS sumAfeeposition,
            SUM(aquantuty * afeeposition) AS totalAmount
        FROM 
            tfu_feeposition
        GROUP BY 
            TO_CHAR(atransdte, 'MM/YYYY')
        ORDER BY 
            TO_DATE(TO_CHAR(atransdte, 'MM/YYYY'), 'MM/YYYY');
END;

CREATE OR REPLACE PROCEDURE GetCustomerInfoByAccount (
    p_acustaccount IN tfu_customerinfo.acustaccount%TYPE,
    p_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    OPEN p_cursor FOR
        SELECT a.atblid,a.aname,a.asex,a.aadress,a.aphone,a.aemail,a.acustaccount,a.acostcenter,a.acusttype,a.acreatedate,a.amodifydate
        FROM tfu_customerinfo a
        WHERE a.acustaccount = p_acustaccount;
    
END;

create or replace procedure GetFeepositionOfCustomer(
    p_aclientcode IN tfu_feeposition.aclientcode%TYPE,
    p_fromdate IN tfu_feeposition.atransdte%TYPE,
    p_todate IN tfu_feeposition.atransdte%TYPE,
    p_cursor OUT SYS_REFCURSOR
)
IS 
BEGIN
    OPEN p_cursor FOR
    SELECT 
        TO_CHAR(atransdte, 'DD/MM/YYYY') as atransdte,aclientcode,aquantuty,afeeposition,avalue,astatus,f.acreateby,TO_CHAR(f.acreatedte, 'DD/MM/YYYY') as acreatedte,c.aname
    FROM tfu_feeposition f,tfu_customerinfo c 
    WHERE   c.acustaccount=f.aclientcode
            AND (f.aclientcode=p_aclientcode or p_aclientcode is null)
            AND (f.atransdte>=p_fromdate or p_fromdate is null)
            AND (f.atransdte<=p_todate or p_todate is null)
    ORDER BY atransdte;
END;

--Exam3

CREATE OR REPLACE VIEW v_dataexam3
AS 
SELECT 
    ROW_NUMBER() OVER (PARTITION BY 
        CASE 
            WHEN c.acustaccount = '058P300113' THEN 'Tự doanh'
            WHEN (c.acusttype = 1 OR c.acusttype = 3) THEN 'Trong nước'
            WHEN (c.acusttype = 2 OR c.acusttype = 4) THEN 'Nước ngoài'
        END 
        ORDER BY c.acustaccount) AS stt,
    CASE 
        WHEN c.acustaccount = '058P300113' THEN 'Tự doanh'
        WHEN (c.acusttype = 1 OR c.acusttype = 3) THEN 'Trong nước'
        WHEN (c.acusttype = 2 OR c.acusttype = 4) THEN 'Nước ngoài'
    END AS grouptype,
    c.acustaccount AS acustaccount,
    c.aname AS aname,
    f.aquantuty AS aquantuty,
    f.afeeposition AS afeeposition,
    (f.aquantuty * f.afeeposition) AS avalue,
    f.atransdte AS atransdte,
    CASE 
        WHEN c.acostcenter = 1 THEN 'HN'
        WHEN c.acostcenter = 2 THEN 'DN'
        WHEN c.acostcenter = 3 THEN 'HCM'
    END AS acostcenter
FROM 
    tfu_feeposition f
JOIN 
    tfu_customerinfo c ON c.acustaccount = f.aclientcode;


CREATE OR REPLACE PROCEDURE getdataexam3(
    p_grouptype IN NVARCHAR2,
    p_acustaccount IN v_dataexam3.acustaccount%TYPE,
    p_fromdate IN v_dataexam3.atransdte%TYPE,
    p_todate IN v_dataexam3.atransdte%TYPE,
    p_acostcenter IN v_dataexam3.acostcenter%TYPE,
    p_cursor OUT SYS_REFCURSOR
)
IS 
BEGIN
    OPEN p_cursor FOR 
    SELECT 1,grouptype AS stt,grouptype AS grouptype,NULL AS acustaccount,NULL AS aname,SUM(aquantuty) AS aquantuty,NULL AS afeeposition,SUM(avalue) AS avalue
    FROM v_dataexam3 v
    WHERE   (v.acustaccount=p_acustaccount OR p_acustaccount is null)
            AND (v.grouptype=p_grouptype OR p_grouptype is null)
            AND (v.acostcenter=p_acostcenter OR p_acostcenter is null)
            AND (v.atransdte>= p_fromdate OR p_fromdate is null)
            AND (v.atransdte<= p_todate OR p_todate is null)
    GROUP BY grouptype

    UNION ALL

    SELECT 3,'Tổng' AS stt,NULL AS grouptype,NULL AS acustaccount,NULL AS aname, SUM(aquantuty) AS aquantuty, NULL AS afeeposition,SUM(avalue) AS avalue
    FROM v_dataexam3 v
    WHERE   (v.acustaccount=p_acustaccount OR p_acustaccount is null)
            AND (v.grouptype=p_grouptype OR p_grouptype is null)
            AND (v.acostcenter=p_acostcenter OR p_acostcenter is null)
            AND (v.atransdte>= p_fromdate OR p_fromdate is null)
            AND (v.atransdte<= p_todate OR p_todate is null)
    ORDER BY grouptype DESC;
END;


CREATE OR REPLACE PROCEDURE getdataexam3_Detail(
    p_grouptype IN NVARCHAR2,
    p_acustaccount IN v_dataexam3.acustaccount%TYPE,
    p_fromdate IN v_dataexam3.atransdte%TYPE,
    p_todate IN v_dataexam3.atransdte%TYPE,
    p_acostcenter IN v_dataexam3.acostcenter%TYPE,
    p_cursor OUT SYS_REFCURSOR
)
IS 
BEGIN
    OPEN p_cursor FOR 
    SELECT 1,grouptype AS stt,grouptype AS grouptype,NULL AS acustaccount,NULL AS aname,SUM(aquantuty) AS aquantuty,NULL AS afeeposition,SUM(avalue) AS avalue
    FROM v_dataexam3 v
    WHERE   (v.acustaccount=p_acustaccount OR p_acustaccount is null)
            AND (v.grouptype=p_grouptype OR p_grouptype is null)
            AND (v.acostcenter=p_acostcenter OR p_acostcenter is null)
            AND (v.atransdte>= p_fromdate OR p_fromdate is null)
            AND (v.atransdte<= p_todate OR p_todate is null)
    GROUP BY grouptype

    UNION ALL

    SELECT 2,TO_CHAR(stt) AS stt,grouptype AS grouptype,acustaccount,aname,aquantuty,afeeposition,avalue
    FROM v_dataexam3 v
    WHERE   (v.acustaccount=p_acustaccount OR p_acustaccount is null)
            AND (v.grouptype=p_grouptype OR p_grouptype is null)
            AND (v.acostcenter=p_acostcenter OR p_acostcenter is null)
            AND (v.atransdte>= p_fromdate OR p_fromdate is null)
            AND (v.atransdte<= p_todate OR p_todate is null)

    UNION ALL

    SELECT 3,'Tổng' AS stt,NULL AS grouptype,NULL AS acustaccount,NULL AS aname, SUM(aquantuty) AS aquantuty, NULL AS afeeposition,SUM(avalue) AS avalue
    FROM v_dataexam3 v
    WHERE   (v.acustaccount=p_acustaccount OR p_acustaccount is null)
            AND (v.grouptype=p_grouptype OR p_grouptype is null)
            AND (v.acostcenter=p_acostcenter OR p_acostcenter is null)
            AND (v.atransdte>= p_fromdate OR p_fromdate is null)
            AND (v.atransdte<= p_todate OR p_todate is null)
    ORDER BY grouptype DESC,1,stt;
END;


--Nhap




