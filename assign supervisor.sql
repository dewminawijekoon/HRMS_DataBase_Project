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



