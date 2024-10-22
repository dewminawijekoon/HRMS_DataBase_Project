drop database if exists hrms;
create database hrms;
use hrms;

create table branch (
  branch_id int auto_increment,
  branch_name varchar(40)not null,
  branch_address varchar(40)not null,
  primary key (branch_id)
);

create table custom_attribute (
  custom_attribute_id int auto_increment,
  value varchar(40),
  primary key (custom_attribute_id)
);

create table custom_employee_record (
  custom_employee_record_id int auto_increment,
  custom_attribute_id int,
  custom_attribute_name varchar(40),
  primary key (custom_employee_record_id),
  foreign key (custom_attribute_id) references custom_attribute(custom_attribute_id) on delete cascade on update cascade
);

create table organization (
  organization_id int auto_increment,
  custom_employee_record_id int,
  field varchar(40),
  main_branch_id int,
  primary key (organization_id),
  foreign key (main_branch_id) references branch(branch_id) on delete cascade on update cascade,
  foreign key (custom_employee_record_id) references custom_employee_record(custom_employee_record_id) on delete cascade on update cascade
);

create table leave_limit (
  leave_type_id int auto_increment,
  pay_grade int not null unique,
  annual_leave_count int not null,
  casual_leave_count int not null,
  maternity_leave_count int not null,
  nopay_leave_count int not null,
  primary key (leave_type_id)
);

create table employee_position (
  job_title varchar(40),
  employee_status varchar(40),
  pay_grade int not null references leave_limit(pay_grade) on delete set null on update cascade ,
  basic_salary numeric(6,2) not null,
  primary key (job_title,employee_status)
);

create table department (
  department_id int auto_increment,
  department_name varchar(40)not null,
  budget numeric(10,2),
  primary key (department_id)
);

create table employee (
  employee_id  varchar(40),
  first_name varchar(40),
  last_name varchar(40),
  birthday date,
  employee_nic varchar(40) not null unique,
  gender varchar(40),
  marital_status varchar(40),
  number_of_dependents int,
  address varchar(40),
  contact_number varchar(40)not null,
  business_email varchar(40),
  job_title varchar(40),
  department_id int,
  branch_id int,
  profile_photo varchar(40),
  primary key (employee_id),
  foreign key (job_title) references employee_position(job_title) on delete set null on update cascade,
  foreign key (department_id) references department(department_id) on delete set null on update cascade,
  foreign key (branch_id) references branch(branch_id) on delete set null on update cascade,
  check (  marital_status  in ('Married','Single'))
);
create table supervisor(
	employee_id varchar(40),
	supervisor_id varchar(40),
	date date,
    primary key(employee_id,supervisor_id),
    foreign key (employee_id) references employee(employee_id) on delete cascade on update cascade
    );
create table employee_of_the_month(
	employee_id varchar(40),
    year varchar(40),
    month varchar(40),
    primary key (year,month) ,
    foreign key (employee_id) references employee(employee_id) on delete cascade on update cascade
);

create table emergency_contact (
  emergency_contact_id varchar(40),
  name varchar(40),
  nic varchar(40)not null,
  address varchar(40),
  emergency_contact_number varchar(40)not null,
  primary key ( emergency_contact_id) ,
  foreign key ( emergency_contact_id) references employee(employee_id) on delete cascade on update cascade
);
create table leave_count_record (
  employee_id varchar(40),
  leave_type_id int,
  annual_leave_remaining int,
  casual_leave_remaining int,
  maternity_leave_remaining int,
  nopay_leave_remaining int,
  primary key (employee_id),
  foreign key (leave_type_id) references leave_limit(leave_type_id) on delete set null on update cascade,
  foreign key (employee_id) references employee(employee_id) on delete cascade on update cascade
);

create table leave_request (
  leave_request_id int auto_increment,
  employee_id varchar(40),
  request_date date,
  leave_start_date date,
  period_of_absence int,
  reason_for_absence varchar(40),
  type_of_leave varchar(40),
  request_status char,
  primary key (leave_request_id),
  foreign key (employee_id) references employee(employee_id) on delete cascade on update cascade,
  check (  request_status  in ('P','R','A')),
  check ( type_of_leave  in ('annual', 'casual', 'maternity', 'nopay'))
);

create table users (
  username varchar(40),
  password varchar(255),
  employee_id varchar(40) unique,
  last_login_date date,
  primary key (username, password),
  foreign key (employee_id) references employee(employee_id) on delete cascade on update cascade
);

create table user_access (
  username varchar(40),
  is_admin  boolean not null,
  is_supervisor boolean not null,
  primary key (username),
  foreign key (username) references users(username) on delete cascade on update cascade,
  check (is_admin  in (true,false)),
  check ( is_supervisor  in (true,false))
);

alter table department
add department_head_id varchar(40);

alter table department
add foreign key (department_head_id) references employee(employee_id) on delete cascade on update cascade;

alter table custom_attribute
add employee_id varchar(40);

alter table custom_attribute
add foreign key (employee_id) references employee(employee_id) on delete cascade on update cascade;

alter table branch
add organization_id int;

alter table branch
add foreign key (organization_id) references organization(organization_id) on delete set null on update cascade;
