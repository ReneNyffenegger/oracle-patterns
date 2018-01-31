set feedback off
set verify off

create table new_value_test (
  col Varchar2(20)
);


insert into new_value_test values ('val one'  );
insert into new_value_test values ('val two'  );
insert into new_value_test values ('val three');

column col new_value var

select col from new_value_test;

drop table new_value_test purge;

prompt var is: &var
/*
   var is: val three
*/
