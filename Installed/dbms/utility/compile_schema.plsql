select name, type, substrb(text, 1, 100) from user_errors;

create table tq84_cs_tab (
  col_foo varchar2(10),
  col_bar varchar2(10),
  col_baz varchar2(10)
);

create view tq84_cs_vw as select * from tq84_cs_tab;

select name, type from user_errors;

alter table tq84_cs_tab rename column col_baz to xyz;


select name, type from user_errors;
exec dbms_utility.compile_schema(user, false)
select name, type, substrb(text, 1, 100) from user_errors;


alter table tq84_cs_tab rename column xyz to col_baz;
exec dbms_utility.compile_schema(user, false)
select name, type, substrb(text, 1, 100) from user_errors;


drop view  tq84_cs_vw;
drop table tq84_cs_tab purge;
