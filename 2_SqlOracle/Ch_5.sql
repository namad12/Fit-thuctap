--Chuong 5

--a
CREATE SEQUENCE dept_deptid_seq
    START WITH 200    
    INCREMENT BY 10   
    MAXVALUE 1000     
    NOCYCLE           
    NOCACHE; 

--b
-- Chèn d? li?u vào b?ng departments
INSERT INTO departments 
VALUES (dept_deptid_seq.NEXTVAL, 'HR Department', 1700);

INSERT INTO departments 
VALUES (dept_deptid_seq.NEXTVAL, 'Finance Department', 1800);

-- Ki?m tra các hàng v?a chèn
SELECT * FROM departments; 

--c
ALTER SEQUENCE dept_deptid_seq
   MAXVALUE 10000
   INCREMENT BY 20;
   
--d
CREATE INDEX id_departments_name
ON departments (department_name);

--e
CREATE SYNONYM emp
FOR employees;

