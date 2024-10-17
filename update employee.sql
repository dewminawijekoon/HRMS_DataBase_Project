/*update employee*/
drop procedure if exists update_employee;

delimiter //
create procedure update_employee (
    in p_employee_id varchar(40),
    in p_first_name varchar(40),
    in p_last_name varchar(40),
    in p_birthday date,
    in p_nic varchar(40),
    in p_gender varchar(40),
    in p_marital_status varchar(40),
    in p_number_of_dependents int,
    in p_address varchar(40),
    in p_contact_number varchar(40),
    in p_business_email varchar(40),
    in p_job_title varchar(40),
    in p_employee_status varchar(40),
    in p_dept_name varchar(40),
    in p_brch_name varchar(40),
    in p_profile_photo varchar(40),
    in p_emergency_contact_name varchar(40),
    in p_emergency_contact_nic varchar(40),
    in p_emergency_contact_address varchar(40),
    in p_emergency_contact_number varchar(40)
)
begin
    declare p_department_id int;
    declare p_branch_id int;
    declare p_pay_grade int;
    declare p_leave_type_id int;

    select department_id
    into p_department_id
    from department
    where department_name = p_dept_name;

    select branch_id
    into p_branch_id
    from branch
    where branch_name = p_brch_name;

    select pay_grade
    into p_pay_grade
    from employee_position
    where job_title = p_job_title
    and employee_status = p_employee_status;

    select leave_type_id
    into p_leave_type_id
    from leave_limit
    where pay_grade = p_pay_grade;

    update employee
    set
        first_name = p_first_name,
        last_name = p_last_name,
        birthday = p_birthday,
        employee_nic = p_nic,
        gender = p_gender,
        marital_status = p_marital_status,
        number_of_dependents = p_number_of_dependents,
        address = p_address,
        contact_number = p_contact_number,
        business_email = p_business_email,
        job_title = p_job_title,
        department_id = p_department_id,
        branch_id = p_branch_id,
        profile_photo = p_profile_photo
    where employee_id = p_employee_id;

    update emergency_contact
    set
        name = p_emergency_contact_name,
        nic = p_emergency_contact_nic,
        address = p_emergency_contact_address,
        emergency_contact_number = p_emergency_contact_number
    where emergency_contact_id = p_employee_id;
end //
delimiter ;
