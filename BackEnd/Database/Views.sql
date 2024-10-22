create view 
show_supervisors as
select distinct supervisor.supervisor_id ,employee.first_name,employee.last_name 
from supervisor 
left join employee on supervisor.supervisor_id=employee.employee_id;
