-- Bài chuong 3
--a. There are four coding errors in the following statement. Can you identify them

SELECT employee_id, last_name
sal x 12 ANNUAL SALARY
FROM employees;

--> Đọc lại câu hỏi. Câu hỏi nó hỏi là có 4 lỗi sau trong câu lệnh, chỉ ra 4 lỗi sai đấy, chứ không phải viết lại câu lệnh cho đúng cú pháp
--> Lỗi 1: không có trường sal
--> Lỗi 2: dấu x bị sai cú pháp, sửa lại thành *
--> Lỗi 3: thiếu dấu , sau trường last_name
--> Lỗi 4: tên alias không được có khoảng trắng
--> sau đó mới viết lại cho đúng cú pháp câu lệnh

SELECT employee_id, last_name, salary * 12 AS ANNUAL_SALARY
FROM employee;


--b true
SELECT last_name, job_id, salary AS Sal
FROM employees;
--> OK

--c
--> câu c không làm à
select null * 2 from dual; --> kết quả của câu lệnh trên là null
select null || 'name' from dual --> kết quả của câu lệnh trên là name

--d
SELECT e.last_name,e.department_id,d.department_name
FROM employee e
JOIN department d ON e.department_id = d.department_id;

--> ok
--> có thể viết câu lệnh trên dưới dạng ngắn gọn hơn như sau
SELECT e.last_name, e.department_id, d.department_name
FROM employee e, department d
WHERE e.department_id = d.department_id;


--e
SELECT Department_Name || ', it is assigned Manager Id: ' || NVL(TO_CHAR(Manager_ID), 'No Manager') AS "Department and Manager"
FROM  department;

--> ok
 
--f 
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

--> ok
--> có thể viết câu lệnh ngắn hơn

--g
SELECT e.last_name,e.hire_date
FROM myschema.employee e
WHERE e.hire_date > (SELECT e.hire_date
                     FRom myschema.employee e
                     WHERE  e.last_name = 'Davies' );
                     
--> ko nên để cùng tên viết tắt của bảng trong query với sub query giống nhau đều là e nhá


--h
SELECT e.last_name,e.hire_date,d.last_name as manager, d.hire_date as manager_hire_date
FROM employee e JOIN employee d ON e.manager_id = d.employee_id
WHERE e.hire_date < d.hire_date;

--> ok

--i

--> câu i không làm à

--j
SELECT e.employee_id, e.last_name
FROM employee e
WHERE e.department_id IN (
    SELECT DISTINCT department_id
    FROM employee
    WHERE last_name LIKE '%u%'
);

--> ok

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


--> điền các câu em làm vào trước rồi anh review nốt, không thì anh ko biết nó là câu nào
