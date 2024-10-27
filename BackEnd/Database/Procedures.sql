/*employeen team*/
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

/*job state*/
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

/*customize employee attribute*/
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

/*delete leave request*/
delimiter //
create procedure delete_request(
    in p_leave_id varchar(40)
)
begin    
	delete from leave_request where leave_request_id =p_leave_id and request_status = 'P';
end //
delimiter ;
