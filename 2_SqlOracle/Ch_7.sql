-- Chuong 7

--a
SELECT last_name, 
       CEIL(MONTHS_BETWEEN(SYSDATE, hire_date)) AS MONTHS_WORKED
FROM employee
ORDER BY MONTHS_WORKED DESC;
--> OK

--b
SELECT last_name || ' earns ' || salary || ' monthly but wants ' || (salary * 3) AS "Dream Salaries"
FROM employee;
--> OK

--c
SELECT last_name, TO_CHAR(salary, '$999,999,999') AS "SALARY"
FROM employee;

--> 
SELECT last_name,
       LPAD('$' || TO_CHAR(salary, 'FM999999999999999'), 15) AS SALARY
FROM employees;


--d
SELECT last_name,
       hire_date,
       TO_CHAR(
           NEXT_DAY(hire_date + INTERVAL '6' MONTH, 'Monday'),
           'Day, "the" day "of" Month, YYYY'
       ) AS REVIEW
FROM employee;
--> OK

--> còn câu E, F, G, H, I, J, K đâu rồi nhể
--e
SELECT last_name,
       NVL(TO_CHAR(commission_pct), 'No Commission') AS COMM
FROM employee;

--f
SELECT ROUND(MAX(salary)) AS Maximum,
       ROUND(MIN(salary)) AS Minimum,
       ROUND(SUM(salary)) AS Sum,
       ROUND(AVG(salary)) AS Average
FROM employee;

--g
SELECT e.job_id,COUNT(*) AS number_e
FROM employee e
group by e.job_id;

--h
SELECT MAX(salary) AS max_salary,MIN(salary) AS min_salary ,MAX(salary) - MIN(salary) AS DIFFERENCE
FROM employee;

--i
SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) = 1995 THEN 1 ELSE 0 END) AS hired_1995,
    SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) = 1996 THEN 1 ELSE 0 END) AS hired_1996,
    SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) = 1997 THEN 1 ELSE 0 END) AS hired_1997,
    SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) = 1998 THEN 1 ELSE 0 END) AS hired_1998
FROM employee;

--j
CREATE OR REPLACE FUNCTION display_employees_by_dept(p_dept_id IN NUMBER) 
RETURN SYS_REFCURSOR IS
   v_cursor SYS_REFCURSOR;
BEGIN
  OPEN v_cursor FOR
    SELECT *
    FROM employee
    WHERE department_id = p_dept_id;
  
  RETURN v_cursor;
END;

--k
CREATE OR REPLACE PROCEDURE display_title_after_5_years(
    p_employee_id IN NUMBER,
    p_new_grade   OUT CHAR,
    p_new_title   OUT VARCHAR2
) IS
  v_hire_date DATE;
  v_salary NUMBER;
  v_current_grade CHAR(1);
  v_new_grade CHAR(1);
  v_months_worked NUMBER := 60; -- 5 năm = 60 tháng
  v_new_title VARCHAR2(100);

BEGIN
  -- Lấy ngày tuyển dụng và mức lương hiện tại của nhân viên
  SELECT hire_date, salary 
  INTO v_hire_date, v_salary
  FROM employee
  WHERE employee_id = p_employee_id;

  -- Xác định cấp bậc hiện tại dựa trên mức lương
  SELECT grade
  INTO v_current_grade
  FROM Job_Grades
  WHERE v_salary BETWEEN lowest_sal AND highest_sal;

  -- Tính cấp bậc mới dựa trên quy tắc tăng lương
  IF v_current_grade IN ('A', 'B') THEN
    IF v_months_worked >= 18 THEN
      v_new_grade := 'B';
    ELSE
      v_new_grade := v_current_grade;
    END IF;
  ELSIF v_current_grade = 'C' THEN
    IF v_months_worked >= 36 THEN
      v_new_grade := 'D';
    ELSE
      v_new_grade := v_current_grade;
    END IF;
  ELSIF v_current_grade = 'D' THEN
    IF v_months_worked >= 48 THEN
      v_new_grade := 'E';
    ELSE
      v_new_grade := v_current_grade;
    END IF;
  ELSIF v_current_grade = 'E' THEN
    IF v_months_worked >= 120 THEN
      v_new_grade := 'F';
    ELSE
      v_new_grade := v_current_grade;
    END IF;
  ELSE
    v_new_grade := v_current_grade;
  END IF;

  -- Xác định chức danh mới dựa trên cấp bậc mới
  IF v_new_grade = 'D' THEN
    v_new_title := 'Team Leader';
  ELSIF v_new_grade = 'E' THEN
    v_new_title := 'Manager';
  ELSIF v_new_grade = 'F' THEN
    v_new_title := 'Director';
  ELSE
    v_new_title := 'Employee';
  END IF;
    
  -- Hiển thị kết quả
  p_new_grade:=v_new_grade;
  p_new_title:=v_new_title;
END;
