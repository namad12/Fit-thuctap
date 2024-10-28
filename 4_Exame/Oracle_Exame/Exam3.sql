--1
SELECT t.Alstupdtetme,t.AID, t.Aamt
FROM tTEMP t
WHERE TO_DATE(t.Alstupdtetme,'dd-Mon-yyyy')='02-Oct-2018'

--2
INSERT INTO tTableD (aID, aName, aAge)
SELECT aID, aName, aAge FROM tTableA
UNION ALL
SELECT aID, aName, aAge FROM tTableB
UNION ALL
SELECT aID, aName, aAge FROM tTablec;

--3
-- c.	Select distinct a.*  from temployees a, tdepartments b where a.aempid = b.aempid;

--4
--a) The value of v_weight at position 1 is: 2 - NUMBER
--b) The value of v_new_locn at position 1 is: Wesrern ?uope - VARCHAR2
--c) The value of v_weight at position 2 is: 601- NUMBER
--d) The value of v_message at position 2 is: Product 10012 is in stock - VARCHAR2
--e) The value of v_new_locn at position 2 is: Loi - bien này chi ton tai trong khoi con

--5
CURSOR c_dept IS 
SELECT d.adepid, d.adepname
FROM tDepartments d
WHERE d.adepid<100
ORDER BY adepid;

--6
CREATE OR REPLACE PROCEDURE emp_section (
    v_aempname IN temployees.aempname%TYPE
)
IS 
    CURSOR  c_emp IS 
    SELECT  *
    FROM    temployees 
    WHERE   temployees.aempname=v_aempname;
BEGIN
    FOR e IN c_emp
    LOOP 
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || e.aempid || ' Employee Name: ' || e.aempname);
    END LOOP; 
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END:

--7

DECLARE
    v_empname employees.empname%TYPE;
    v_salary  employees.salary%TYPE ;
BEGIN
    v_salary := 1500;
    
    SELECT empname
    INTO v_empname
    FROM temployees
    WHERE  aempsal=v_salary;
    
    INSERT INTO tMessage
    VALUES ('Employee’s name : ' ||v_empname||' Salary: '|| v_salary);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO tMessage
        VALUES ('No employee with salary of  ' || v_salary);
    WHEN TOO_MANY_ROWS THEN
        INSERT INTO tMessage
        VALUES ('More than one employee with a salary of   ' || v_salary);
END;

--8 

--a
CREATE OR REPLACE PROCEDURE sptregions_i (
    v_id tRegions.aregid%TYPE,
    v_name tRegions.aregname%TYPE
) 
IS 
BEGIN
    INSERT INTO  tRegions
    VALUES (v_id,v_name);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

-- b
DECLARE
    v_region_id   tRegions.aregid%TYPE := 1;                
    v_region_name tRegions.aregname%TYPE := 'North';     
BEGIN
    sptregions_i(v_region_id, v_region_name);
    
    IF SQL%ROWCOUNT > 0 THEN
      DBMS_OUTPUT.PUT_LINE('tRegions inserted successfully: ' || v_region_name);
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM); 
END;

-- c
DROP PROCEDURE sptregions_i;

-- d
RENAME sptregions_i TO sptregions_insert;




