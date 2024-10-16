-- chuong 6
-- a) The %TYPE attribute: 
1. Is used to declare a variable according to a database column definition
2. Is used to declare a variable according to a collection of columns in a database table or view
3. Is used to declare a variable according to the definition of another declared variable 
4. Is prefixed with the database table and column name or the name of the declared variable
--> câu 1 đúng: %TYPE được sử dụng để khai báo một biến theo định nghĩa của một cột trong cơ sở dữ liệu.
--> câu 2 sai: Nó không được sử dụng để khai báo một biến theo một tập hợp các cột trong bảng hoặc view
--> câu 3 đúng: %TYPE cũng có thể được sử dụng để khai báo một biến theo định nghĩa của một biến đã được khai báo khác.
--> câu 4 đúng: %TYPE được tiền tố bởi tên bảng và tên cột, hoặc tên của biến đã khai báo.
       
--b
SELECT e.employee_id, e.job_id, 
       DECODE(JOB_ID,
              'AD_PRES', 'A',
              'ST_MAN', 'B',
              'IT_PROG', 'C',
              'SA_REP', 'D',
              'ST_CLERK', 'E',
              '0') AS GRADE
FROM employee e;
--> OK

--c
SELECT e.employee_id, e.job_id, 
       CASE 
           WHEN JOB_ID = 'AD_PRES' THEN 'A'
           WHEN JOB_ID = 'ST_MAN' THEN 'B'
           WHEN JOB_ID = 'IT_PROG' THEN 'C'
           WHEN JOB_ID = 'SA_REP' THEN 'D'
           WHEN JOB_ID = 'ST_CLERK' THEN 'E'
           ELSE '0'
       END AS GRADE
FROM employee e;
--> OK

--d
SELECT last_name,
       hire_date,
       TO_CHAR(hire_date, 'Day') AS DAY
FROM employee
ORDER BY CASE TO_CHAR(hire_date, 'D')
             WHEN '1' THEN 2 
             WHEN '2' THEN 3 
             WHEN '3' THEN 4 
             WHEN '4' THEN 5 
             WHEN '5' THEN 6 
             WHEN '6' THEN 7 
             WHEN '7' THEN 1 
             END;
--> không cần phải viết case when
SELECT last_name,
       hire_date,
       TO_CHAR(hire_date, 'Day') AS DAY
FROM employees
ORDER BY TO_CHAR(hire_date, 'D');


--e
SELECT e.last_name,e.salary,e.salary+e.salary*0.15 AS New_salary
FROM employee e;
--> chưa có hàm round để làm tròn thành số nguyên --> xem lại đề bài có chỗ ghi:  15.5% (expressed as a whole number) 
SELECT employee_id,
       last_name,
       salary,
       ROUND(salary * 1.155) AS "New Salary"
FROM employees;

--f
SELECT INITCAP(last_name) AS formatted_last_name, LENGTH(last_name) AS name_length
FROM employee
WHERE last_name LIKE 'J%'
   OR last_name LIKE 'A%'
   OR last_name LIKE 'M%';
--> OK

--g
-- create emp3
CREATE TABLE Emp3
AS
SELECT *
FROM employee
WHERE 1 = 0;
--> OK
--
DECLARE
    CURSOR cr_ep IS SELECT * FROM employee;
BEGIN 
    FOR u in cr_ep
    LOOP
        dbms_output.put_line(u.FIRST_NAME);
        INSERT INTO Emp3 VALUES u;
    END LOOP;
END;
SELECT * FROM Emp3
--> có thể dùng theo cách mở con trỏ như này 
DECLARE
    CURSOR emp_cursor IS
        SELECT * FROM Employees;
    
    emp_record Employees%ROWTYPE;  -- Định nghĩa biến để lưu từng bản ghi
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;  -- Thoát vòng lặp khi không còn bản ghi

        INSERT INTO Emp3 VALUES emp_record;  -- Chèn bản ghi vào Emp3
    END LOOP;
    CLOSE emp_cursor;
END;

--h
DECLARE
  CURSOR cr_emp IS
    SELECT employee_id, job_id, first_name, last_name
    FROM employee;
  v_grade CHAR(1);
BEGIN
  FOR emp_record IN cr_emp LOOP 
    
    SELECT DECODE(emp_record.job_id,
                  'AD_PRES', 'A', 
                  'ST_MAN', 'B', 
                  'IT_PROG', 'C', 
                  'SA_REP', 'D', 
                  'ST_CLERK', 'E', 
                  '0')
    INTO v_grade
    FROM dual;
    
    DBMS_OUTPUT.PUT_LINE('Employee ' || emp_record.first_name || ' ' || emp_record.last_name || 
                         ' has a grade of ' || v_grade);
  END LOOP;
END; 
--> OK
--> tham khảo thêm cách viết khác
DECLARE
    CURSOR emp_cursor IS
        SELECT last_name, grade FROM Employees;  -- Thay đổi nếu cột tên khác
    emp_record emp_cursor%ROWTYPE;  -- Định nghĩa biến để lưu từng bản ghi
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;  -- Thoát khi không còn bản ghi

        -- In ra họ và điểm của nhân viên
        DBMS_OUTPUT.PUT_LINE('Last Name: ' || emp_record.last_name || ', Grade: ' || emp_record.grade);
    END LOOP;
    CLOSE emp_cursor;
END;




