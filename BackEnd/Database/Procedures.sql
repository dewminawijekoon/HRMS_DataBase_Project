-- add new employee
delimiter //
create procedure add_employee (
    in employee_id varchar(40),
    in first_name varchar(40),
    in last_name varchar(40),
    in birthday date,
    in nic varchar(40),
    in gender varchar(40),
    in marital_status varchar(40),
    in number_of_dependents int,
    in address varchar(40),
    in contact_number varchar(40),
    in business_email varchar(40),
    in p_job_title varchar(40),
	  in p_employee_status varchar(40),
    in dept_name varchar(40),
    in brch_name varchar(40),
    in p_profile_photo varchar(40),
	  in emergency_contact_name varchar(40),
	  in emergency_contact_nic varchar(40),
	  in emergency_contact_address varchar(40),
    in emergency_contact_number varchar(40)
)
begin
    declare p_position_id int;
    declare p_department_id int;
    declare p_branch_id int;
	  declare p_pay_grade int;
    declare p_annual_leave_count int;
    declare p_casual_leave_count int;
    declare p_maternity_leave_count int;
    declare p_nopay_leave_count int;
    declare p_leave_type_id int;

    declare exit handler for sqlexception
    begin
        rollback;
        signal sqlstate '45000' set message_text = 'Error inserting employee data';
    end;
    
    start transaction;

    select department_id into p_department_id from department where department_name = dept_name;
    select branch_id into p_branch_id from branch where branch_name = brch_name;
    select pay_grade into p_pay_grade from employee_position where job_title = p_job_title and employee_status = p_employee_status;
    select annual_leave_count into p_annual_leave_count from leave_limit where pay_grade = p_pay_grade;
    select casual_leave_count into p_casual_leave_count from leave_limit where pay_grade = p_pay_grade;
    select maternity_leave_count into p_maternity_leave_count from leave_limit where pay_grade = p_pay_grade;
    select nopay_leave_count into p_nopay_leave_count from leave_limit where pay_grade = p_pay_grade;
    select leave_type_id into p_leave_type_id from leave_limit where pay_grade = p_pay_grade;

    insert into employee (
        employee_id, first_name, last_name, birthday, employee_nic, gender, marital_status, number_of_dependents,
        address, contact_number, business_email, job_title, department_id, branch_id, profile_photo
    ) 
    values (
        employee_id, first_name, last_name, birthday, nic, gender, marital_status, number_of_dependents,
        address, contact_number, business_email, p_job_title, p_department_id, p_branch_id, p_profile_photo
    );

    insert into emergency_contact (emergency_contact_id, name, nic, address, emergency_contact_number)
    values (employee_id, emergency_contact_name, emergency_contact_nic, emergency_contact_address, emergency_contact_number);
    
    insert into leave_count_record (
        employee_id, leave_type_id, annual_leave_remaining, casual_leave_remaining, maternity_leave_remaining, nopay_leave_remaining
    )
    values (employee_id, p_leave_type_id, p_annual_leave_count, p_casual_leave_count, p_maternity_leave_count, p_nopay_leave_count);
    
    commit;
end //
delimiter ;

-- create user account
delimiter //
create procedure create_user_account(
    in username varchar(40),
    in password varchar(255),
    in p_employee_id varchar(40),
    in access_level varchar(40)
)
begin
    declare exit handler for sqlexception
    begin
        rollback;
        signal sqlstate '45000' set message_text = 'Error creating user account';
    end;
    
    start transaction;
    
    if access_level = 'Admin' then
        insert into users (username, password, employee_id)
		values (username, password, p_employee_id);
        insert into user_access (username, is_admin, is_supervisor) values (username, true, true);
        
    elseif access_level = 'Supervisor' then
        insert into users (username, password, employee_id)
		values (username, password, p_employee_id);
        insert into user_access (username, is_admin, is_supervisor) values (username, false, true);
        insert into supervisor(supervisor_id, employee_id, date) 
		values((select employee_id from employee where job_title = 'HR assistent'), p_employee_id, curdate());
        
    else
        insert into users (username, password, employee_id)
		values (username, password, p_employee_id);
        insert into user_access (username, is_admin, is_supervisor) values (username, false, false);
        insert into supervisor (supervisor_id, employee_id, date)
		values (generate_supervisor(), p_employee_id, curdate());
    end if;
    
    commit;
end;
//
delimiter ;


-- show leave request
delimiter //
create procedure show_leave_request(
    in p_supervisor_id varchar(40)
)
begin    
    select *
	from leave_request
    left join supervisor using (employee_id)
    where supervisor.supervisor_id = p_supervisor_id
	and leave_request.request_status = 'P';
end //
delimiter ;

-- create leave request
delimiter //
create procedure create_leave_request(
    in p_employee_id varchar(40),   
    in p_leave_start_date date,
    in p_period_of_absence varchar(40),
    in p_reason_for_absence varchar(40),
    in p_type_of_leave varchar(40)
)
begin
    declare curr_date date;
    declare p_supervisor_id varchar(40);
    declare leave_remaining varchar(40);
    declare exit handler for sqlexception 
    begin
        rollback;
        select 'An error occurred while processing the leave request';
    end;
    
    start transaction;

    set curr_date = curdate();
    
    select supervisor_id
    into p_supervisor_id
    from supervisor 
    where employee_id = p_employee_id;
    
    if p_type_of_leave = 'annual' and (select annual_leave_remaining from leave_count_record where employee_id = p_employee_id) > p_period_of_absence then
        insert into leave_request (employee_id, request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
        values (p_employee_id, curr_date, p_leave_start_date, p_period_of_absence, p_reason_for_absence, p_type_of_leave, 'P');
        
    elseif p_type_of_leave = 'casual' and (select casual_leave_remaining from leave_count_record where employee_id = p_employee_id) > p_period_of_absence then
        insert into leave_request (employee_id, request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
        values (p_employee_id, curr_date, p_leave_start_date, p_period_of_absence, p_reason_for_absence, p_type_of_leave, 'P');
        
    elseif p_type_of_leave = 'maternity' and (select maternity_leave_remaining from leave_count_record where employee_id = p_employee_id) > p_period_of_absence then
        insert into leave_request (employee_id, request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
        values (p_employee_id, curr_date, p_leave_start_date, p_period_of_absence, p_reason_for_absence, p_type_of_leave, 'P');
        
    elseif p_type_of_leave = 'nopay' and (select nopay_leave_remaining from leave_count_record where employee_id = p_employee_id) > p_period_of_absence then
        insert into leave_request (employee_id, request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
        values (p_employee_id, curr_date, p_leave_start_date, p_period_of_absence, p_reason_for_absence, p_type_of_leave, 'P');
    end if;

    commit;

end //
delimiter ;

-- evaluate leave request
delimiter //
create procedure evaluate_leave_request(
    in p_leave_id varchar(40),
    in supervisor_replay varchar(40)
)
begin    
	declare p_type_of_leave varchar(40);
    declare no_of_days int;
    declare p_employee_id varchar(40);
    
	select employee_id
    into p_employee_id
    from leave_request
    where leave_request_id = p_leave_id;
    
    select type_of_leave
    into p_type_of_leave
    from leave_request
    where leave_request_id = p_leave_id;
    
    select period_of_absence
    into no_of_days
    from leave_request
    where leave_request_id = p_leave_id;
    
    update leave_request
    set request_status = supervisor_replay
    where employee_id = p_employee_id;
    
     if p_type_of_leave = 'anuual' and supervisor_replay = 'A' then
		update leave_count_record
        set annual_leave_remaining = annual_leave_remaining - no_of_days
        where employee_id = p_employee_id;
        
    elseif p_type_of_leave = 'casual' and supervisor_replay = 'A' then
		update leave_count_record
        set casual_leave_remaining = casual_leave_remaining - no_of_days
        where employee_id = p_employee_id;
    
    elseif p_type_of_leave = 'maternity' and supervisor_replay = 'A' then
		update leave_count_record
        set maternity_leave_remaining = maternity_leave_remaining - no_of_days
        where employee_id = p_employee_id;
    
	elseif p_type_of_leave = 'nopay' and supervisor_replay = 'A' then
    update leave_count_record
        set nopay_leave_remaining = nopay_leave_remaining - no_of_days
        where employee_id = p_employee_id;
    end if;
end //
delimiter ;

-- get employee_id by username
delimiter //
create procedure get_employee_id_by_username(
    in p_username varchar(40)
)
begin    
    select employee_id
	from users
    where username = p_username;
end //
delimiter ;

-- get employee of the month
delimiter //
create procedure employee_of_the_month()
begin
    if not exists (
        select 1 
        from employee_of_the_month 
        where year = year(curdate()) 
        and month = month(curdate())
    ) then
        insert into employee_of_the_month(employee_id, year, month)
        values (generate_employee_of_the_month(), year(curdate()), month(curdate()));
    end if;
    
    select employee.first_name, employee.last_name, employee_of_the_month.year, employee_of_the_month.month
    from employee_of_the_month
    left join employee using (employee_id)
    where employee_of_the_month.year = year(curdate()) 
    and employee_of_the_month.month = month(curdate());
end //
delimiter ;

-- add organization
delimiter //
create procedure add_organization(
    in p_field varchar(40),
    in p_main_branch varchar(40)
)
begin    
	declare p_branch_id  varchar(40);
    
	select branch_id
    into p_branch_id
    from branch
    where branch_name = p_main_branch;
    
    insert into organization(field,main_branch_id) values(p_field,p_branch_id);
end //
delimiter ;

-- detele employee
delimiter //
create procedure delete_employee(
    in p_employee_id varchar(40),
    in d_employee_id varchar(40)
)
begin
    declare exit handler for sqlexception 
    begin
        rollback;
        select 'An error occurred while deleting the employee';
    end;

    start transaction;
    
    if (select is_admin from user_access where username = (select username from users where employee_id = p_employee_id limit 1)) = true then
        delete from employee where employee_id = d_employee_id;
    end if;

    commit;

end //
delimiter ;

-- customize employee record
delimiter //
create procedure customize_employee_record(
    in p_organization varchar(40),
    in p_custom_attribute_name varchar(40)
)
begin    
	declare p_organization_id  varchar(40);
    
	select organization_id
    into p_organization_id
    from organization
    where field = p_organization;
    
    insert into custom_employee_record(custom_attribute_name) values(p_custom_attribute_name);
    update organization set  custom_employee_record_id = (select custom_employee_record_id from custom_employee_record order by custom_employee_record_id desc limit 1)
    where organization_id =p_organization_id;
end //
delimiter ;

-- customize employee attribute
delimiter //
create procedure customize_employee_attribute(
    in p_employee_id varchar(40),
    in p_custom_attribute_name varchar(40),
    in p_value varchar(40)
)
begin    
	declare p_custom_attribute_id  varchar(40);
    
	select custom_employee_record_id
    into p_custom_attribute_id
    from custom_employee_record
    where custom_attribute_name = p_custom_attribute_name;
    
    insert into custom_attribute(value,employee_id) values(p_value,p_employee_id);
    update custom_employee_record set custom_attribute_id = (select custom_attribute_id from custom_attribute order by custom_attribute_id desc limit 1)
    where custom_employee_record_id = p_custom_attribute_id;
end //
delimiter ;
drop procedure if exists update_employee;

-- update employee details
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

    declare exit handler for sqlexception 
    begin
        rollback;
        select 'An error occurred while updating the employee';
    end;

    start transaction;

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

    commit;

end //
delimiter ;

-- customize employee attribute
delimiter //
create procedure is_admin(
    in p_username varchar(40)
)
begin    
	select is_admin
    from user_access
    where username = p_username;
end //
delimiter ;

-- delete leave request
delimiter //
create procedure delete_request(
    in p_leave_id varchar(40)
)
begin    
	delete from leave_request where leave_request_id =p_leave_id and request_status = 'P';
end //
delimiter ;

-- employeen team
delimiter //
create procedure employee_team(
    in p_supervisor_id varchar(40)
)
begin    
	select employee_id,first_name,last_name
    from supervisor
    join employee  using (employee_id)
    where supervisor_id =p_supervisor_id;
end //
delimiter ;

-- job state check
delimiter //
create procedure role_checker(
    in p_username varchar(40) 
)
begin
    select 
        case 
            when is_admin = 1 and is_supervisor = 1 then 'admin'
            when is_admin = 0 and is_supervisor = 1 then 'supervisor'
            when is_admin = 0 and is_supervisor = 0 then 'employee'
            else 'unknown'
        end as user_role
    from 
        user_access
    where 
        username = p_username;
end //
delimiter ;

-- dashboard informations
delimiter //
create procedure get_leave_count()
begin
  select count(leave_request_id)
  from leave_request 
  where request_status = 'A'  
  and (leave_start_date <= current_date())
  and (date_add(leave_start_date, interval period_of_absence day) > current_date());
end //
delimiter ;

delimiter //
create procedure get_parttime_employee_count_presentage()
begin
  declare count_of_employee int;
  select count(employee.employee_id) 
  into count_of_employee
  from employee ;
  select count(employee.employee_id) as part_time_employee_count , count(employee.employee_id)/count_of_employee as part_time_employee_presentage
  from employee 
  inner join employee_position using(job_title)
  where employee_position.employee_status = 'part-time';
end //
delimiter ;

delimiter //
create procedure get_fulltime_employee_count_presentage()
begin
  declare count_of_employee int;
  select count(employee.employee_id) 
  into count_of_employee
  from employee ;
  select count(employee.employee_id) as full_time_employee_count , count(employee.employee_id)/count_of_employee as full_time_employee_presentage
  from employee 
  inner join employee_position using(job_title)
  where employee_position.employee_status = 'full-time';
end //
delimiter ;

-- for report purpose
delimiter //
create procedure employee_by_department_presentages()
begin
	declare count_of_employee int;
	select count(employee.employee_id) 
	into count_of_employee
	from employee ;
    select department.department_name , count(employee.employee_id)/count_of_employee as presentage_by_department
    from employee 
    join department using (department_id)
    group  by department.department_name;
end //
delimiter ;

delimiter //
create procedure employees_by_role_presentages()
begin
	declare count_of_employee int;
	select count(employee.employee_id) 
	into count_of_employee
	from employee ;
    select employee_position.job_title,count(employee.employee_id)/count_of_employee as presentage_by_role
    from employee 
    join employee_position using (job_title)
    group by employee_position.job_title;
end //
delimiter ;

delimiter //
create procedure  employees_by_pay_grade_presentages()
begin
	declare count_of_employee int;
	select count(employee.employee_id) 
	into count_of_employee
	from employee ;
    select employee_position.pay_grade,count(employee.employee_id)/count_of_employee as presentage_by_pay_grade
    from employee 
    join employee_position using(job_title)
    group by employee_position.pay_grade;
end //
delimiter ;

delimiter //
create procedure employees_by_gender_presentages()
begin
    declare count_of_employee int;
	select count(employee.employee_id) 
	into count_of_employee
	from employee ;
    select gender,count(employee.employee_id)/count_of_employee as presentage_by_gender
    from employee 
    group by gender;
end //
delimiter ;

delimiter //
create procedure last_month_leave_presentage()
begin
	declare count_of_employee int;
	select count(employee.employee_id) 
	into count_of_employee
	from employee ;
    select leave_request.leave_start_date,count(employee.employee_id)/count_of_employee as presentage_by_date_of_leave_request
    from employee 
    join leave_request using(employee_id)
    where leave_request.request_status = 'A' 
    and leave_request.leave_start_date >= curdate() - interval 1 month
    group by leave_request.leave_start_date;
end //
delimiter ;

-- login time add
delimiter //
create procedure login_update(
    in p_username varchar(40)
)
begin    
	update users
    set last_login_date = current_date()
    where username = p_username;
end //
delimiter ;

/*
-- select all details entered
delimiter //
create procedure select_employee_details (
    in p_employee_id varchar(40)
)
begin
    select
        employee.employee_id,
        employee.first_name,
        employee.last_name,
        employee.birthday,
        employee.employee_nic,
        employee.gender,
        employee.marital_status,
        employee.number_of_dependents,
        employee.address,
        employee.contact_number,
        employee.business_email,
        employee.job_title,
        employee_position.employee_status,
        department.department_name,
        branch.branch_name,
		    employee.profile_photo,
        emergency_contact.name,
        emergency_contact.nic,
        emergency_contact.address,
        emergency_contact.emergency_contact_number
    from employee 
    left join department using(department_id)
    left join branch using (branch_id)
    left join emergency_contact on employee.employee_id = emergency_contact.emergency_contact_id
    left join employee_position using (job_title)
    where employee.employee_id = p_employee_id;
end //
delimiter ;
*/
-- supervisors details
delimiter //
create procedure supervisors_details()
begin    
    	select employee.employee_id,employee.first_name,employee.last_name
	from  users
	join  employee using (employee_id)
	join  user_access using (username)
	where is_admin = false and is_supervisor = true;
end //
delimiter ;

-- employeen team with gender
delimiter //
create procedure employee_team_for_supervisor(
    in p_supervisor_id varchar(40)
)
begin    
    select employee.employee_id,employee.first_name,employee.last_name,employee.gender
    from supervisor
    join employee  using (employee_id)
    where supervisor.supervisor_id =p_supervisor_id;
end //
delimiter ;

delimiter //

-- all details of employee wich enters
create procedure select_employee_details (
    in p_employee_id varchar(40)
)
begin
    select
        employee.employee_id,
        employee.first_name,
        employee.last_name,
        employee.birthday,
        employee.employee_nic,
        employee.gender,
        employee.marital_status,
        employee.number_of_dependents,
        employee.address,
        employee.contact_number,
        employee.business_email,
        employee.job_title,
        employee_position.employee_status,
        department.department_name,
        branch.branch_name,
		    employee.profile_photo,
        emergency_contact.name,
        emergency_contact.nic,
        emergency_contact.address,
        emergency_contact.emergency_contact_number,
        leave_count_record.annual_leave_remaining,
        leave_count_record.casual_leave_remaining,
        leave_count_record.maternity_leave_remaining,
        leave_count_record.nopay_leave_remaining
    from employee 
    left join department using(department_id)
    left join branch using (branch_id)
    left join leave_count_record using (employee_id)
    left join emergency_contact on employee.employee_id = emergency_contact.emergency_contact_id
    left join employee_position using (job_title)
    where employee.employee_id = p_employee_id;
end //
delimiter ;

-- employee leave details for admin
delimiter //
create procedure employee_leave_details_for_admin()
begin
    select  leave_request.leave_request_id, 
			employee.employee_id,
            employee.first_name,
            employee.last_name,
            leave_request.request_status,
            leave_request.leave_start_date,
            leave_request.period_of_absence,
            leave_request.request_date,
            leave_request.type_of_leave,
            leave_request.reason_for_absence
	from  employee
	join  leave_request using (employee_id)
    order by request_status;
end //
delimiter ;

-- birthday employees
delimiter //
create procedure birthday_employees_today()
begin
    select first_name,last_name
    from employee 
    where day(birthday) = day(curdate())
    and month(birthday) = month(curdate());
end //
delimiter ;

-- details of the employee in each category
delimiter //
create procedure admins()
begin
    select employee.first_name,employee.last_name
	from  users
	join  employee using (employee_id)
	join  user_access using (username)
	where is_admin = true and is_supervisor = true;
end //
delimiter ;

delimiter //
create procedure employees()
begin
    select employee.first_name,employee.last_name
	from  users
	join  employee using (employee_id)
	join  user_access using (username)
	where is_admin = false and is_supervisor = false;
end //
delimiter ;

delimiter //
create procedure supervisors()
begin
    select employee.first_name,employee.last_name
	from  users
	join  employee using (employee_id)
	join  user_access using (username)
	where is_admin = false and is_supervisor = true;
end //
delimiter ;

-- leave request Pending list
delimiter //
create procedure leave_request_Pending_list(
	in p_supervisor_id varchar(40)
    )
begin
    select  
		leave_request.leave_request_id, 
		leave_request.employee_id, 
		leave_request.request_date, 
        leave_request.leave_start_date,  
        leave_request.period_of_absence, 
        leave_request.reason_for_absence,
        leave_request.type_of_leave,
        leave_request.request_status,
        employee.first_name,
        employee.last_name,
        employee.gender
		from  leave_request
		left join  employee using (employee_id)
        left join supervisor using (employee_id)
		where leave_request.request_status = 'P'
        and supervisor.supervisor_id = p_supervisor_id;
end //
delimiter ;

-- get employee organization base info if exits
delimiter //
create procedure get_employee_other_details (
    in p_employee_id varchar(40)
)
begin
    if exists (select 1 from custom_attribute where employee_id = p_employee_id) then
        select custom_attribute.value, custom_employee_record.custom_attribute_name
        from custom_attribute
        join custom_employee_record using (custom_attribute_id)
        where custom_attribute.employee_id = p_employee_id;
    end if;
end //
delimiter ;
