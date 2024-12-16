-- Chuong 8

--a
PROCEDURE add_employee(
   p_employee_id    IN employee.employee_id%TYPE,
   p_first_name     IN employee.first_name%TYPE,
   p_last_name      IN employee.last_name%TYPE,
   p_email          IN employee.email%TYPE,
   p_phone_number   IN employee.phone_number%TYPE,
   p_hire_date      IN employee.hire_date%TYPE,
   p_job_id         IN employee.job_id%TYPE,
   p_salary         IN employee.salary%TYPE,
   p_commission_pct IN employee.commission_pct%TYPE,
   p_manager_id     IN employee.manager_id%TYPE,
   p_department_id  IN employee.department_id%TYPE,

   --> đề bài yêu cầu trả ra thông báo về kết quả của thao tác thì phải thêm biến trả ra kết quả
   p_message         OUT VARCHAR2
) 
IS
BEGIN
   -- Thuc hien chèn dữ liệu vào bảng Employees
   INSERT INTO employee (
      employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
   ) VALUES (
      p_employee_id, p_first_name, p_last_name, p_email, p_phone_number, p_hire_date, p_job_id, p_salary, p_commission_pct, p_manager_id, p_department_id
   );
   --> thêm commit để lưu thay đổi vào cơ sở dữ liệu
   COMMIT;

    -- Ki?m tra xem có b?n ghi nào b? ?nh hu?ng
   IF SQL%ROWCOUNT > 0 THEN
      -- DBMS_OUTPUT.PUT_LINE('Insert operation succeeded for employee ' || p_first_name || ' ' || p_last_name);
      p_message := 'Insert operation succeeded.';
   ELSE
      -- DBMS_OUTPUT.PUT_LINE('Insert operation no succeeded for employee ' || p_first_name || ' ' || p_last_name);
      p_message := 'Insert operation failed: ';
   END IF;
EXCEPTION -- Bắt lỗi nếu có sự cố trong quá trình chèn
    WHEN OTHERS THEN
        p_message := 'Insert operation failed: ' || SQLERRM;
        ROLLBACK; -- Hoàn tác nếu có lỗi 
END add_employee;

--> xem lại các thay đổi anh đã sửa nhá

-- b đã sửa
CREATE OR REPLACE PROCEDURE up_employee_phone(
   p_employee_id   IN employees.employee_id%TYPE,
   p_phone_number  IN employees.phone_number%TYPE ,
   --> đề bài yêu cầu trả ra thông báo về kết quả của thao tác thì phải thêm biến trả ra kết quả
   p_message      OUT VARCHAR2
) IS
BEGIN
   UPDATE employees
   SET phone_number = p_phone_number
   WHERE employee_id = p_employee_id;
   IF SQL%ROWCOUNT > 0 THEN
      p_message := 'Phone number updated successfully for employee ID ' || TO_CHAR( p_employee_id);
   ELSE
      p_message := 'No employee found with ID ' || TO_CHAR( p_employee_id);
   
   END IF;
   EXCEPTION 
    WHEN OTHERS THEN
        p_message := 'Insert operation failed: ' || SQLERRM;
        ROLLBACK;
END;

--> không có exception
--> còn lại thì ok
--> xem lại câu a) anh sửa cho em nhé

-- c đã sửa
CREATE OR REPLACE PROCEDURE add_department(
   p_department_id   IN department.department_id%TYPE,
   p_department_name IN department.department_name%TYPE,
   p_manager_id      IN department.manager_id%TYPE,
   p_location_id     IN department.location_id%TYPE,
   p_message      OUT VARCHAR2
) IS
BEGIN
   -- Chèn dữ liệu vào bảng departments
   INSERT INTO department 
   VALUES (p_department_id, p_department_name, p_manager_id, p_location_id);

   -- Hiện thông thông báo nếu chèn thành công
   IF SQL%ROWCOUNT > 0 THEN
       p_message :='Department inserted successfully: ' || p_department_name;
   ELSE
        p_message :='failed';
   END IF;
   EXCEPTION -- Bắt lỗi nếu có sự cố trong quá trình chèn
    WHEN OTHERS THEN
        p_message := 'Insert operation failed: ' || SQLERRM;
        ROLLBACK;
END;

--> tương tự câu a) anh đã sửa
-- thiếu paramter output của sp
-- thiếu bắt exception 

--d đã sửa
CREATE OR REPLACE PROCEDURE up_department(
    p_department_id   IN department.department_id%TYPE,
    p_department_name IN department.department_name%TYPE,
    p_manager_id      IN department.manager_id%TYPE,
    p_location_id     IN department.location_id%TYPE,
    p_message      OUT VARCHAR2
)
IS 
BEGIN 
    UPDATE department
    SET department_name = p_department_name,
        manager_id = p_manager_id,
        location_id = p_location_id
    WHERE department_id = p_department_id;
    IF SQL%ROWCOUNT > 0 THEN
        p_message :='Department updated successfully: ' || TO_CHAR( p_department_name);
   ELSE
        p_message :='failed';
   END IF;
   EXCEPTION -- Bắt lỗi nếu có sự cố trong quá trình chèn
    WHEN OTHERS THEN
        p_message := 'Insert operation failed: ' || SQLERRM;
        ROLLBACK;
END;
--> tương tự bị các lỗi sai như các câu phía trên

--e đã sửa
CREATE OR REPLACE PROCEDURE add_job_grades(
    p_grades job_grades.grade%TYPE,
    p_lowest_sal job_grades.lowest_sal%TYPE,
    p_highest_sal job_grades.highest_sal%TYPE,
    p_message      OUT VARCHAR2
) 
IS 
BEGIN 
    INSERT INTO job_grades
    VALUES (p_grades,p_lowest_sal,p_highest_sal);
    IF SQL%ROWCOUNT > 0 THEN
       p_message :='Job_grades insert successfully: ' || p_grades;
   ELSE
       p_message :='failed';
   END IF;
    EXCEPTION -- Bắt lỗi nếu có sự cố trong quá trình chèn
    WHEN OTHERS THEN
        p_message := 'Insert operation failed: ' || SQLERRM;
        ROLLBACK;
END;
--> tương tự bị các lỗi sai như các câu phía trên

--f đã sửa
CREATE OR REPLACE PROCEDURE del_Job_grades(
    p_grade     IN job_grades.grade%TYPE,
    p_message   OUT VARCHAR2
    )
IS 
BEGIN
    DELETE FROM job_grades
    WHERE grade = p_grade;
    IF SQL%ROWCOUNT > 0 THEN
       p_message :='Job_grades delete successfully: ' || p_grade;
    ELSE
       p_message :='failed';
    END IF;
    EXCEPTION -- Bắt lỗi nếu có sự cố trong quá trình chèn
    WHEN OTHERS THEN
        p_message := 'Insert operation failed: ' || SQLERRM;
        ROLLBACK;
END;
--> tương tự bị các lỗi sai như các câu phía trên


--g
CREATE PROCEDURE get_emp_report IS
BEGIN
    FOR emp_record IN 
        (SELECT e.last_name, e.department_id, d.department_name
         FROM employee e
         JOIN department d ON e.department_id = d.department_id
         ORDER BY e.last_name) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Last Name: ' || emp_record.last_name || 
                             ', Department ID: ' || emp_record.department_id || 
                             ', Department Name: ' || emp_record.department_name);
    END LOOP;
END;

EXEC get_emp_report;
--> OK

--h
CREATE OR REPLACE PROCEDURE get_hired_emp_by_year(p_year IN NUMBER) IS
BEGIN
    FOR emp_record IN 
        (SELECT e.last_name, e.hire_date
         FROM employee e
         WHERE EXTRACT(YEAR FROM e.hire_date) = p_year
         ORDER BY e.hire_date) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Last Name: ' || emp_record.last_name || 
                             ', Hire Date: ' || TO_CHAR(emp_record.hire_date, 'DD-MON-YYYY'));
    END LOOP;
END;

EXEC get_hired_emp_by_year(1994);
--> OK
