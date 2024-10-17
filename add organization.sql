/*add organization*/
delimiter //
create procedure add_organization(
    in p_field varchar(40),
    in p_main_branch varchar(40)
)
begin    
	declare p_branch_id  varchar(40);
    
	select branch_id
    into p_branch_id
    from branch
    where branch_name = p_main_branch;
    
    insert into organization(field,main_branch_id) values(p_field,p_branch_id);
end //
delimiter ;