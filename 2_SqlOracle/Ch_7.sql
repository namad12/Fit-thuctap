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
