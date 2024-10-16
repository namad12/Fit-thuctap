-- CHuong 9

--a
--
CREATE TABLE tblLog(
    log_id NUMBER(8), 
    log_date DATE
);
--> cột trong đề bài là id mờ, sao lại ghi là log_id

-- 
CREATE SEQUENCE tblLog_seq
    START WITH 10    
    INCREMENT BY 10   
    MAXVALUE 1000     
    NOCYCLE           
    NOCACHE; 
-> OK
--
CREATE PROCEDURE sp_tblLog_insert IS
BEGIN
    INSERT INTO tblLog
    VALUES (tblLog_seq.NEXTVAL, SYSDATE);  
END; 

--> OK
--
BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'job_sp_tblLog_insert',
        job_type        => 'STORED_PROCEDURE',
        job_action      => 'sp_tblLog_insert',
        start_date      => TO_TIMESTAMP('2024-10-15 06:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        repeat_interval => 'FREQ=DAILY; BYHOUR=6; BYMINUTE=0',
        enabled         => TRUE,
        auto_drop       => FALSE,
        comments        => 'T? d?ng chèn vào b?ng tblJob vào 6:00am '
    );
    COMMIT;
END;
--> OK

--b
CREATE USER phu IDENTIFIED BY phu123;
--
GRANT SELECT, INSERT ON job_grades TO phu;
--
REVOKE SELECT, INSERT ON job_grades TO phu;

--> OK

--c
CREATE USER USER01 IDENTIFIED BY phu01123;
CREATE USER USER02 IDENTIFIED BY phu01123;
CREATE USER USER03 IDENTIFIED BY phu01123;

GRANT CReate session to USER01;
GRANT CReate session to USER02;
GRANT CReate session to USER03;

GRANT SELECT ON employee TO user01 WITH GRANT OPTION;

--
GRANT SELECT ON user01.Employee TO user02 WITH GRANT OPTION;

SELECT * FROM user01.Employee;

GRANT SELECT ON user01.Employee TO user03;

REVOKE SELECT ON user01.Employee FROM user02;


--> OK

--d
GRANT SELECT, INSERT, UPDATE, DELETE ON department TO phu;
--> OK
