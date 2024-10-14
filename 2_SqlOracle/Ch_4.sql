-- Chuong 4

-- a
CREATE VIEW vw_EMPLOYEES AS
SELECT employee_id, 
       first_name || ' ' || last_name AS EMPLOYEE, 
       department_id
FROM employees;

--b
SELECT *
FROM vw_employees 

--c
SELECT EMPLOYEE, department_id
FROM vw_employees;

--d
CREATE VIEW DEPT50 (EMPNO, EMPLOYEE, DEPTNO)
AS
SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id = 50
WITH READ ONLY;

--e
SELECT * FROM DEPT50 WHERE EMPLOYEE = 'Matos';

UPDATE DEPT50
SET DEPTNO = 80
WHERE EMPLOYEE = 'Matos';

