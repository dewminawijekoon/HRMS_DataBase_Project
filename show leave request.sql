/*show leave request*/
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