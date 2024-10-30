--1
SELECT t.Alstupdtetme,t.AID, t.Aamt
FROM tTEMP t
WHERE TO_DATE(t.Alstupdtetme,'dd-Mon-yyyy')='02-Oct-2018'

-- chữa bài
SELECT t.Alstupdtetme,t.AID, t.Aamt
FROM tTEMP t
WHERE t.Alstupdtetme >= '02-Oct-2018' and t.Alstupdtetme < '03-Oct-2018';

--> viết câu query dữ liệu hiển thị như e viết cũng đúng nhưng chưa phải câu lệnh query tốt nhất
-- vì không nên dùng hàm ở cột của table TO_DATE(t.Alstupdtetme,'dd-Mon-yyyy') trong điều kiện where khi dữ liệu nó lớn thì sẽ select rất lâu


--2
INSERT INTO tTableD (aID, aName, aAge)
SELECT aID, aName, aAge FROM tTableA
UNION ALL
SELECT aID, aName, aAge FROM tTableB
UNION ALL
SELECT aID, aName, aAge FROM tTablec;

--> OK, nhưng sau khi insert thì cần câu lệnh commit; để tránh hold tài nguyên (ví dụ em insert dữ liệu vào db trên server, em chưa commit thì anh 
-- select bảng tTableD thì nó sẽ không có dữ liệu mà em vừa insert)

--3
-- c.	Select distinct a.*  from temployees a, tdepartments b where a.aempid = b.aempid;

--> câu b) sẽ cho hiệu suất tốt hơn câu c) nhá 
--b.	Select * from temployees a where exists (select 1 from tdepartments b where a.aempid =b.aempid);
-- vì: câu c sử dụng join 2 bảng, khi join thì sử dụng distinct để loại bỏ các kết quả trùng lặp nên với lượng dữ liệu lớn
-- nó sẽ làm tốn tài nguyên vì cần duyệt qua toàn bộ dữ liệu của 2 bảng
--> còn với câu b nó sẽ select ra toàn bộ employee sử dụng exists: nó sẽ giúp dừng tìm kiếm khi tìm thấy bản ghi khớp đầu tiền mà ko cần 
-- duyệt qua toàn bộ kết quả để tìm dữ ra dữ liệu khớp


--4
--a) The value of v_weight at position 1 is: 2 - NUMBER
--b) The value of v_new_locn at position 1 is: Wesrern Europe - VARCHAR2
--c) The value of v_weight at position 2 is: 601- NUMBER
--d) The value of v_message at position 2 is: Product 10012 is in stock - VARCHAR2
--e) The value of v_new_locn at position 2 is: Loi - bien nay chi ton tai trong khoi con
--> OK

--5
CURSOR c_dept IS 
SELECT d.adepid, d.adepname
FROM tDepartments d
WHERE d.adepid<100
ORDER BY adepid;
--> OK

--6
CREATE OR REPLACE PROCEDURE emp_section (
    v_aempname IN temployees.aempname%TYPE,
    p_cursor OUT SYS_REFCURSOR,
    p_Message OUT NVARCHAR2
)
IS 
BEGIN
    OPEN p_cursor FOR
    SELECT  *
    FROM    temployees 
    WHERE   temployees.aempname=v_aempname;
    
EXCEPTION
  WHEN OTHERS THEN
    p_Message:='Error: ' || SQLERRM;
END;

--> The sample output is as followes: Employee ID: 1 Employee Name: Joseph
--> vậy thì con trỏ em select * thì chưa đúng
--> Phải sửa chỗ select thành select 'Employee ID: ' || employeeid || ' Name: ' || employeeName from ...

--7

DECLARE
    v_empname employees.empname%TYPE;
    v_salary  employees.salary%TYPE ;
BEGIN
    v_salary := 1500;
    
    SELECT empname
    INTO v_empname
    FROM temployees
    WHERE  aempsal=v_salary;
    
    INSERT INTO tMessage
    VALUES ('Employee�s name : ' ||v_empname||' Salary: '|| v_salary);
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO tMessage
        VALUES ('No employee with salary of  ' || v_salary);
        COMMIT;
    WHEN TOO_MANY_ROWS THEN
        INSERT INTO tMessage
        VALUES ('More than one employee with a salary of   ' || v_salary);
        COMMIT;
END;

--> a.	In the declarative section, declare two variable: v_aempname of type tEmployees.aempname 
-- and v_aempsal of tEmployees.aempsal. Initialize the latter to 1500.
--> đề bài yêu cầu khởi tạo 2 biến v_aempname và v_aempsal (rồi gán giá trị 1500)
--> câu a phải khai báo lại như này 
v_aempname tEmployees.aempname%Type;
v_aempsal  tEmployees.aempsal%Type:=1500;


--> b. đề bài bảo insert vào bảng tMessage thì nên viết thêm câu lệnh tạo bảng tMessage 
create table tMessage (
    employe_name varchar2(100),
    salary varchar2(100)
);
-- If the salary entered returns only one row
    insert into tMessage values(v_emp.v_aempname, v_emp.v_aempsal);
-- If the salary entered does not return any rows
--> OK
-- If the salary entered returns multiple rows
--> OK

--8 

--a
CREATE OR REPLACE PROCEDURE sptregions_i (
    v_id tRegions.aregid%TYPE,
    v_name tRegions.aregname%TYPE,
    p_Message OUT NVARCHAR2
) 
IS 
BEGIN
    INSERT INTO  tRegions
    VALUES (v_id,v_name);
EXCEPTION
  WHEN OTHERS THEN
    p_Message:='Error: ' || SQLERRM;
END;

--> OK, tuy nhiên nên thêm biến p_returnCode để biết thành công hay thất bại
CREATE OR REPLACE PROCEDURE sptregions_i (
    v_id tRegions.aregid%TYPE,
    v_name tRegions.aregname%TYPE,
    p_returnCode out number,
    p_returnMess OUT NVARCHAR2
) 
IS 
BEGIN
    INSERT INTO  tRegions
    VALUES (v_id,v_name);
    -- nếu insert thành công thì trả return code , mess ra sp
    p_returnCode := 1;
    p_returnMess := 'Success';
EXCEPTION
  WHEN OTHERS THEN
    -- nếu insert lỗi thì đầu tiên cần rollback lại dữ liệu về commit gần nhất
    p_returnCode:= -1;
    p_Message:='Error: ' || sqlcode || ': ' || sqlerrm;
END;

-- b
DECLARE
    v_region_id   tRegions.aregid%TYPE := 1;                
    v_region_name tRegions.aregname%TYPE := 'North';     
BEGIN
    sptregions_i(v_region_id, v_region_name);
    
    IF SQL%ROWCOUNT > 0 THEN
      DBMS_OUTPUT.PUT_LINE('tRegions inserted successfully: ' || v_region_name);
    ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM); 
END;

--> gọi sp, nhưng chưa hứng kết quả trả về 
--> chữa lại 
DECLARE
    v_region_id   tRegions.aregid%TYPE := 1;                
    v_region_name tRegions.aregname%TYPE := 'North';   
    v_returnCode number;
    v_returnMess varchar2;  
BEGIN
    sptregions_i(v_id   => v_region_id, 
                 v_name => v_region_name,
                 p_returnCode => v_returnCode, 
                 p_returnMess => v_returnMess);
    
    dbms_output.put_line('Code: ' || v_returnCode ||'- Message: '||v_returnMess);
END;



-- c
DROP PROCEDURE sptregions_i;
--> OK

-- d
RENAME sptregions_i TO sptregions_insert; --> sai
--> vì không có cách nào để đổi tên một thủ tục từ sptregions_i thành sptregions_insert cả
--> phải drop cái procedure đó đi, sau đó tạo lại 
drop procedure sptregions_i;
create or replace procedure sptregions_insert(region_id number, region_name varchar2)
is 
begin 
    insert into tRegions values(region_id, region_name);
end;



