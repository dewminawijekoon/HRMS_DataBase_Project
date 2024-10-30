insert into branch (branch_name, branch_address)
values
('Headquarters', '123 Main St'),
('Branch A', '456 Elm St'),
('Branch B', '789 Oak St');

insert into department (department_name, budget)
values
('HR', 500000),
('IT', 1000000),
('Finance', 750000),
('Main', 1000000);

insert into employee_position (job_title, employee_status, pay_grade, basic_salary)
values
('HR Manager', 'Full-time', 1, 5000),
('HR assistent', 'Full-time', 1, 1500),
('Software enginner', 'Full-time', 1, 3000),
('Accountant', 'Full-time', 1, 3000),
('QA Engineer', 'Full-time', 1, 3000),
('Worker', 'Full-time', 2, 3000),
('Cleaner', 'Part-time', 3, 3000);

insert into leave_limit (pay_grade, annual_leave_count, casual_leave_count, maternity_leave_count, nopay_leave_count)
values
(1, 20, 10, 0, 5),
(2, 15, 10, 0, 7),
(3, 10, 5, 0, 8);

