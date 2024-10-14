-- chuong 6
-- a-1

-- b
SELECT e.employee_id, e.job_id, 
       DECODE(JOB_ID,
              'AD_PRES', 'A',
              'ST_MAN', 'B',
              'IT_PROG', 'C',
              'SA_REP', 'D',
              'ST_CLERK', 'E',
              '0') AS GRADE
FROM employee e;

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

--e
SELECT e.last_name,e.salary,e.salary+e.salary*0.15 AS New_salary
FROM employee e;

--f
SELECT INITCAP(last_name) AS formatted_last_name, LENGTH(last_name) AS name_length
FROM employee
WHERE last_name LIKE 'J%'
   OR last_name LIKE 'A%'
   OR last_name LIKE 'M%';
   
--g
-- create emp3
CREATE TABLE Emp3
AS
SELECT *
FROM employee
WHERE 1 = 0;

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



