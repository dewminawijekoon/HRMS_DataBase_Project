/* create leave request*/
delimiter //
create procedure create_leave_request(
    in p_employee_id varchar(40),
    in  leave_start_date date,
    in period_of_absence varchar(40),
    in reason_for_absence varchar(40),
    in type_of_leave varchar(40)
)
begin
	declare curr_date date;
    declare  p_supervisor_id varchar(40);
    declare leave_remaining varchar(40);
    
	SET curr_date = DATE_FORMAT(CURDATE(), '%Y-%m-%d');
    
    select supervisor_id
    into  p_supervisor_id
    from supervisor 
    where employee_id = p_employee_id;
    
    
    if type_of_leave = 'anuual' and (select annual_leave_remaining from leave_count_record where employee_id = p_employee_id)>period_of_absence then
		    insert into leave_request (employee_id,request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			value(p_employee_id,curr_date, leave_start_date , period_of_absence, reason_for_absence,type_of_leave, 'P');
    elseif type_of_leave = 'casual' and (select casual_leave_remaining from leave_count_record where employee_id = p_employee_id)>period_of_absence then
			insert into leave_request (employee_id,request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			value(p_employee_id,curr_date, leave_start_date , period_of_absence, reason_for_absence,type_of_leave, 'P');
    elseif type_of_leave = 'maternity' and (select maternity_leave_remaining from leave_count_record where employee_id = p_employee_id)>period_of_absence then
			insert into leave_request (employee_id,request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			value(p_employee_id,curr_date, leave_start_date , period_of_absence, reason_for_absence,type_of_leave, 'P');
	elseif type_of_leave = 'nopay' and (select nopay_leave_remaining from leave_count_record where employee_id = p_employee_id)>period_of_absence then
			insert into leave_request (employee_id, request_date, leave_start_date, period_of_absence, reason_for_absence, type_of_leave, request_status)
			value(p_employee_id,curr_date, leave_start_date , period_of_absence, reason_for_absence,type_of_leave, 'P');
    end if;
	

end //
delimiter ;