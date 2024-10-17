/*procedure call*/
call add_employee('7364528d-ce36-4d7f-a0aa-7cd084c077f3', 'Umesha','Jayakody', '1965-02-24', '949654341V', 'Male','Single', 0, '46,wakanda road,homagama.','0741234567','Umesha.jupiter@company.com','HR Manager','Full-time','HR', 'Headquarters',NULL,'Sahan','992912190V','46,wakanda road,homagama.','0712340123');
call create_user_account('Umesha','Umesha','7364528d-ce36-4d7f-a0aa-7cd084c077f3','Admin');
call add_employee('e10bfb2f-9cb9-4278-ac8c-952ee4428f02', 'Christopher','Ranasinghe', '1963-02-24', '929054321V', 'Male','Married', 2, '48, samagi road, Maharagema.','0751234567','Christopher.jupiter@company.com','HR assistent','Full-time','HR', 'Headquarters',NULL,'Shiranshi','992919190V','48, samagi road, Maharagema.','0710023452');
call create_user_account('Christopher','Christopher','e10bfb2f-9cb9-4278-ac8c-952ee4428f02','Admin');
call add_employee('7b163c45-ce7b-422f-93d9-d72abb4af5ae', 'Araliya','Perera', '1964-01-27', '989654321V', 'Male','Single', 0, '489, parakrame road, kottawa.','0751204567','Araliya.jupiter@company.com','Software enginner','Full-time','IT', 'Headquarters',NULL,'Kumara','923222222V','489, parakrame road, kottawa.','0718152643');
call create_user_account('Araliya','Araliya','7b163c45-ce7b-422f-93d9-d72abb4af5ae','Supervisor');
call add_employee('0ba6900a-c6bd-40ad-bd40-d335fbd42f8b', 'Nayana','Jayarathna', '1968-01-24', '989653329V', 'Female','Single', 0, '400,piliyandala road,pannipitiya.','0751288490','Aayana.jupiter@company.com','Developer','Full-time','IT', 'Headquarters',NULL,'Vibawa','922280690V','400,piliyandala road,pannipitiya.','0711214680');
call create_user_account('Nayana','Nayana','0ba6900a-c6bd-40ad-bd40-d335fbd42f8b','Worker');
call add_employee('21b63c70-5c83-433b-9ab8-de8899d18854', 'Upuli','Jayasinghe', '1960-01-24', '969653320V', 'Female','Married', 6, '91,Athurugiriya road,Malabe.','0752843628','Upuli.jupiter@company.com','Tester','Part-time','IT', 'Headquarters',NULL,'Namal','912340690V','91,Athurugiriya road,Malabe.','0711234580');
call create_user_account('Upuli','Upuli','21b63c70-5c83-433b-9ab8-de8899d18854','Worker');

call create_leave_request('21b63c70-5c83-433b-9ab8-de8899d18854','2024-10-10',5,'Medical Leave','casual');
call create_leave_request('0ba6900a-c6bd-40ad-bd40-d335fbd42f8b','2024-10-10',5,'Medical Leave','casual');

call show_leave_request('7b163c45-ce7b-422f-93d9-d72abb4af5ae');

call evaluate_leave_request('21b63c70-5c83-433b-9ab8-de8899d18854','casual','A',4);
call evaluate_leave_request('0ba6900a-c6bd-40ad-bd40-d335fbd42f8b','casual','R',5);

call get_employee_id_by_username('Upuli');

call employee_of_the_month();

call delete_employee('e10bfb2f-9cb9-4278-ac8c-952ee4428f02','0ba6900a-c6bd-40ad-bd40-d335fbd42f8b');

call add_organization('organization_1','Branch A');

call customize_employee_record('organization_1','nationality');

call customize_employee_attribute ('7b163c45-ce7b-422f-93d9-d72abb4af5ae','nationality','Sri Lankan');

select * from show_supervisors;
select * from show_employee;
select * from show_leave_limit;
select * from show_employee_position;
select * from show_departments;
select * from show_branchs;
select * from show_organization;
