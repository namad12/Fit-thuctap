CREATE TABLE departments (
    department_id      NUMBER(9,0) NOT NULL,
    department_cde     VARCHAR2(20 CHAR) NOT NULL,
    department_name    VARCHAR2(100 CHAR) NOT NULL,
    manager_id         NUMBER(15,0),
    acreateby          VARCHAR2(20 CHAR),
    acreatedte         DATE,
    amodifiedby        VARCHAR2(20 CHAR),
    amodifieddte       DATE  
);

CREATE TABLE employees (
    employees_id     NUMBER(9,0) NOT NULL,
    employees_cde    VARCHAR2(20 CHAR) NOT NULL,
    employees_name   VARCHAR2(100 CHAR) NOT NULL,
    fromdate         DATE,
    todate           DATE,
    acreateby        VARCHAR2(20 CHAR),
    acreatedte       DATE,
    amodifiedby      VARCHAR2(20 CHAR),
    amodifieddte     DATE 
);

INSERT INTO departments (department_id, department_cde, department_name, manager_id, acreateby, acreatedte) 
VALUES (1, 'D001', 'Human Resources', 101, 'admin', SYSDATE);

INSERT INTO departments (department_id, department_cde, department_name, manager_id, acreateby, acreatedte) 
VALUES (2, 'D002', 'Finance', 102, 'admin', SYSDATE);

INSERT INTO departments (department_id, department_cde, department_name, manager_id, acreateby, acreatedte) 
VALUES (3, 'D003', 'IT', 103, 'admin', SYSDATE);

INSERT INTO departments (department_id, department_cde, department_name, manager_id, acreateby, acreatedte) 
VALUES (4, 'D004', 'Marketing', 104, 'admin', SYSDATE);

INSERT INTO departments (department_id, department_cde, department_name, manager_id, acreateby, acreatedte) 
VALUES (5, 'D005', 'Sales', 105, 'admin', SYSDATE);

INSERT INTO employees (employees_id, employees_cde, employees_name, fromdate, todate, acreateby, acreatedte) 
VALUES (101, 'E001', 'John Doe', TO_DATE('2020-01-01', 'YYYY-MM-DD'), NULL, 'admin', SYSDATE);

INSERT INTO employees (employees_id, employees_cde, employees_name, fromdate, todate, acreateby, acreatedte) 
VALUES (102, 'E002', 'Jane Smith', TO_DATE('2019-02-15', 'YYYY-MM-DD'), NULL, 'admin', SYSDATE);

INSERT INTO employees (employees_id, employees_cde, employees_name, fromdate, todate, acreateby, acreatedte) 
VALUES (103, 'E003', 'Robert Brown', TO_DATE('2018-03-10', 'YYYY-MM-DD'), NULL, 'admin', SYSDATE);

INSERT INTO employees (employees_id, employees_cde, employees_name, fromdate, todate, acreateby, acreatedte) 
VALUES (104, 'E004', 'Emily Davis', TO_DATE('2021-06-01', 'YYYY-MM-DD'), NULL, 'admin', SYSDATE);

INSERT INTO employees (employees_id, employees_cde, employees_name, fromdate, todate, acreateby, acreatedte) 
VALUES (105, 'E005', 'Michael Wilson', TO_DATE('2022-07-20', 'YYYY-MM-DD'), NULL, 'admin', SYSDATE);

commit;


create or replace procedure getDepartments(
    p_cursor OUT SYS_REFCURSOR
)
is
begin
    open p_cursor for 
    select d.*,employees_cde 
    from departments d,employees e
    where d.manager_id = e.employees_id;
end;

create or replace procedure getEmployees(
    p_cursor OUT SYS_REFCURSOR
)
is
begin
    open p_cursor for 
    select e.*,department_cde 
    from departments d,employees e
    where d.manager_id = e.employees_id;
end;


create or replace procedure getEmployee_CDE(
    p_employees_cde IN employees.employees_cde%TYPE,
    p_cursor OUT SYS_REFCURSOR
)
is
begin
    open p_cursor for 
    select *
    from employees e
    where e.employees_cde=p_employees_cde;
end;

create or replace procedure selectDepartment(
    p_department_cde  IN departments.department_cde%TYPE DEFAULT NULL,
    p_department_name IN departments.department_name%TYPE DEFAULT NULL,
    p_employees_cde   IN employees.employees_cde%TYPE DEFAULT NULL,
    p_employees_name  IN employees.employees_name%TYPE DEFAULT NULL,
    p_cursor OUT SYS_REFCURSOR
)
is 
begin
    open p_cursor for 
    select d.*,employees_cde 
    from departments d,employees e
    where   d.manager_id = e.employees_id
            and (d.department_cde like '%'|| p_department_cde || '%' or p_department_cde is null)
            and (d.department_name like '%' || p_department_name || '%' or  p_department_name is null )
            and (e.employees_cde  like '%' || p_employees_cde || '%' or  p_employees_cde is null )
            and (e.employees_name  like '%' || employees_name || '%' or  p_employees_name is null );
end;