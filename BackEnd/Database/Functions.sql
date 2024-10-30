-- generate supervisor for each employee
delimiter //
create function generate_supervisor()
returns varchar(40)
deterministic
begin
    declare p_supervisor_id varchar(40);

	select users.employee_id
    into p_supervisor_id
	from users
	join user_access using(username)
	left join supervisor on (users.employee_id = supervisor.supervisor_id)
	where user_access.is_supervisor = true
	group by users.employee_id
	order by count(supervisor.employee_id) asc
	limit 1;

    return p_supervisor_id;
end//
delimiter ;

-- employee of the month
delimiter //
create function generate_employee_of_the_month()
returns varchar(40)
deterministic
begin
    declare employee_of_the_month varchar(40);

	select employee_id
    into employee_of_the_month
	from leave_count_record
    where employee_id not in (select supervisor_id from supervisor )
	order by (annual_leave_remaining + casual_leave_remaining + maternity_leave_remaining + nopay_leave_remaining) desc
	limit 1;
	
    return employee_of_the_month;
end//
delimiter ;