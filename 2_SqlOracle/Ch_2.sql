
--Bài chuong 2
-a
CREATE TABLE SYS.Employee (
    Employee_id NUMBER(6,0) NOT NULL,
    First_name  VARCHAR(20),
    Last_name   VARCHAR(25) NOT NULL,
    Email   VARCHAR(20) NOT NULL,
    Phone_number    VARCHAR(20),
    Hire_date   DATE NOT NULL,
    Job_id  VARCHAR(10) NOT NULL,
    Salary  NUMBER(8,2),
    Commission_pct  NUMBER(2,2),
    Manager_id  NUMBER(6,0),
    Department_id   NUMBER(4,0)
);

SELECT * FROM  SYS.Employee;

CREATE TABLE SYS.Department(
    Department_id   NUMBER(4,0) NOT NULL,
    Department_name VARCHAR2(30) NOT NULL,
    Manager_id  NUMBER(6,0),
    Location_id NUMBER(4,0)
);

SELECT * FROM  SYS.department;

CREATE TABLE SYS.Job_Grades(
    Grade   CHAR(1) NOT NULL,
    Lowest_sal  NUMBER(8,2) NOT NULL,
    Highest_sal NUMBER(8,2) NOT NULL
);
SELECT * FROM SYS.job_grades;

--b
CREATE TABLE SYS.Dept(
    Dept_id NUMBER(7,0) CONSTRAINT de_de_id_pk PRIMARY KEY,
    Depy_name   VARCHAR(25)  
);

SELECT * FROM SYS.Dept;

--c
CREATE TABLE SYS.Emp(
    Emp_id NUMBER(7,0),
    Last_name   VARCHAR2(25),
    First_name  VARCHAR2(25),
    Dept_id NUMBER(7,0),
    CONSTRAINT emp_de_id_fk FOREIGN KEY (Dept_id) REFERENCES SYS.dept(Dept_id)
);

SELECT * FROM SYS.Emp;

--d
ALTER TABLE SYS.emp
ADD Email VARCHAR2(25);

CREATE TABLE Emp2 AS
SELECT 
    EMPLOYEE_ID AS ID, 
    FIRST_NAME, 
    LAST_NAME, 
    SALARY, 
    DEPARTMENT_ID AS DEPT_ID
FROM SYS.Employee;

SELECT * FROM SYS.Emp2;

--e
DROP TABLE SYS.Emp;

--g
INSERT INTO SYS.employee VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', TO_DATE('17-06-1987', 'DD-MM-YYYY'), 'AD_PRES', 24000, NULL, NULL, 90);
INSERT INTO SYS.Employee VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('21-09-1989', 'DD-MM-YYYY'), 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO SYS.Employee VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', TO_DATE('13-01-1993', 'DD-MM-YYYY'), 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO SYS.Employee VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', TO_DATE('03-01-1990', 'DD-MM-YYYY'), 'IT_PROG', 9000, NULL, 102, 60);
INSERT INTO SYS.Employee VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', TO_DATE('21-05-1991', 'DD-MM-YYYY'), 'IT_PROG', 6000, NULL, 103, 60);
INSERT INTO SYS.Employee VALUES (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', TO_DATE('07-02-1999', 'DD-MM-YYYY'), 'IT_PROG', 4200, NULL, 103, 60);
INSERT INTO SYS.Employee VALUES (124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', TO_DATE('16-11-1999', 'DD-MM-YYYY'), 'ST_MAN', 5800, NULL, 100, 50);
INSERT INTO SYS.Employee VALUES (141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', TO_DATE('17-10-1995', 'DD-MM-YYYY'), 'ST_CLERK', 3500, NULL, 124, 50);
INSERT INTO SYS.Employee VALUES (142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', TO_DATE('29-01-1997', 'DD-MM-YYYY'), 'ST_CLERK', 3100, NULL, 124, 50);
INSERT INTO SYS.Employee VALUES (143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', TO_DATE('15-03-1998', 'DD-MM-YYYY'), 'ST_CLERK', 2600, NULL, 124, 50);
INSERT INTO SYS.Employee VALUES (144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', TO_DATE('09-07-1998', 'DD-MM-YYYY'), 'ST_CLERK', 2500, NULL, 124, 50);
INSERT INTO SYS.Employee VALUES (149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', TO_DATE('29-01-2000', 'DD-MM-YYYY'), 'SA_MAN', 10500, 0.2, 100, 80);
INSERT INTO SYS.Employee VALUES (174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', TO_DATE('11-05-1996', 'DD-MM-YYYY'), 'SA_REP', 11000, 0.3, 149, 80);
INSERT INTO SYS.Employee VALUES (176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', TO_DATE('24-03-1998', 'DD-MM-YYYY'), 'SA_REP', 8600, 0.2, 149, 80);
INSERT INTO SYS.Employee VALUES (178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', TO_DATE('24-05-1999', 'DD-MM-YYYY'), 'SA_REP', 7000, 0.15, 149, NULL);
INSERT INTO SYS.Employee VALUES (200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', TO_DATE('17-09-1987', 'DD-MM-YYYY'), 'AD_ASST', 4400, NULL, 101, 10);
INSERT INTO SYS.Employee VALUES (201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', TO_DATE('17-02-1996', 'DD-MM-YYYY'), 'MK_MAN', 13000, NULL, 100, 20);
INSERT INTO SYS.Employee VALUES (202, 'Pat', 'Fay', 'PFAY', '603.123.6666', TO_DATE('17-08-1997', 'DD-MM-YYYY'), 'MK_REP', 6000, NULL, 201, 20);
INSERT INTO SYS.Employee VALUES (205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', TO_DATE('07-06-1994', 'DD-MM-YYYY'), 'AC_MGR', 12000, NULL, 101, 110);
INSERT INTO SYS.Employee VALUES (206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', TO_DATE('07-06-1994', 'DD-MM-YYYY'), 'AC_ACCOUNT', 8300, NULL, 205, 110);
INSERT INTO SYS.Employee VALUES (207, 'TEST', 'TEST', 'TEST', '084.123.4567', TO_DATE('17-06-2018', 'DD-MM-YYYY'), 'IT_PROG', 24000, NULL, NULL, 60);

DELETE FROM employee

insert into department values (10,'Administration',200,1700);
insert into department values (20,'Marketing',201,1800);
insert into department values (50,'Shipping',124,1500);
insert into department values (60,'IT',103,1400);
insert into department values (80,'Sales',149,2500);
insert into department values (90,'Executive',100,1700);
insert into department values (110,'Accounting',205,1700);
insert into department values (190,'Contracting',null,1700);

INSERT INTO SYS.Job_Grades VALUES ('A', 1000, 2999);
INSERT INTO SYS.Job_Grades VALUES ('B', 3000, 5999);
INSERT INTO SYS.Job_Grades VALUES ('C', 6000, 9999);
INSERT INTO SYS.Job_Grades VALUES ('D', 10000, 14999);
INSERT INTO SYS.Job_Grades VALUES ('E', 15000, 24999);
INSERT INTO SYS.Job_Grades VALUES ('F', 25000, 40000);

COMMIT;