create view 
show_supervisors as
select distinct supervisor.supervisor_id ,employee.first_name,employee.last_name 
from supervisor 
left join employee on supervisor.supervisor_id=employee.employee_id;


create view 
show_employee as
select * from employee;

create view 
show_leave_limit as
select * from leave_limit;

create view 
show_employee_position as
select * from employee_position;

create view 
show_emergency_contact as
select * from emergency_contact;

create view 
show_departments as
select * from department;

create view 
show_branchs as
select * from branch;

create view 
show_organization as
select * from organization;

