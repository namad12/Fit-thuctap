-- Bài chuong 3
--a
SELECT employee_id, last_name, salary * 12 AS ANNUAL_SALARY
FROM employee;

--b true

--d
SELECT e.last_name,e.department_id,d.department_name
FROM employee e
JOIN department d ON e.department_id = d.department_id;

--e
SELECT Department_Name || ', it is assigned Manager Id: ' || NVL(TO_CHAR(Manager_ID), 'No Manager') AS "Department and Manager"
FROM  department;
 
SELECT 
    e.last_name AS Employee_Name,
    e.job_id AS Job,
    d.department_name AS Department_Name,
    e.salary AS Salary,
    j.grade AS Grade
FROM 
    employee e
JOIN 
    department d ON e.department_id = d.department_id
JOIN 
    job_grades j ON e.salary BETWEEN j.lowest_sal AND j.highest_sal; 
 -- 
SELECT e.last_name,e.hire_date
FROM SYS.employee e
WHERE e.hire_date > (SELECT e.hire_date
                     FRom SYS.employee e
                     WHERE  e.last_name = 'Davies' );

--
SELECT e.last_name,e.hire_date,d.last_name as manager, d.hire_date as manager_hire_date
FROM employee e JOIN employee d ON e.manager_id = d.employee_id
WHERE e.hire_date < d.hire_date;

--
SELECT e.employee_id, e.last_name
FROM employee e
WHERE e.department_id IN (
    SELECT DISTINCT department_id
    FROM employee
    WHERE last_name LIKE '%u%'
);
--
SELECT employee_id, last_name, salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee)
ORDER BY salary ASC;
--
SELECT last_name, salary
FROM employee
WHERE manager_id = 100; 

--
SELECT e.department_id,e.last_name,e.job_id
FROM employee e JOIN department d ON e.department_id=d.department_id
WHERE d.department_name='Executive';

--
SELECT  e.last_name,d.department_id,d.department_name
FROM    employee e FULL JOIN department d ON e.department_id=d.department_id
