set feedback off
set verify off

create table new_value_test_from (
  col Varchar2(20)
);

create table new_value_test_to (
  col Varchar2(20)
);

insert into new_value_test_from values ('Foo Bar Baz');

column col new_value var

select col from new_value_test_from;

prompt var: &var;
/*
   var: Foo Bar Baz*
*/

insert into new_value_test_to values ('&var');

select * from new_value_test_to;
/*
   COL
   --------------------
   Foo Bar Baz
*/

drop table new_value_test_from purge;
drop table new_value_test_to   purge;
