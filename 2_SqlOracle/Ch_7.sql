-- Chuong 7

--a
SELECT last_name, 
       CEIL(MONTHS_BETWEEN(SYSDATE, hire_date)) AS MONTHS_WORKED
FROM employee
ORDER BY MONTHS_WORKED DESC;

--b
SELECT last_name || ' earns ' || salary || ' monthly but wants ' || (salary * 3) AS "Dream Salaries"
FROM employee;

--c
SELECT last_name, TO_CHAR(salary, '$999,999,999') AS "SALARY"
FROM employee;

--d
SELECT last_name,
       hire_date,
       TO_CHAR(
           NEXT_DAY(hire_date + INTERVAL '6' MONTH, 'Monday'),
           'Day, "the" day "of" Month, YYYY'
       ) AS REVIEW
FROM employee;