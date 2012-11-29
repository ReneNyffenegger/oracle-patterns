start 01_table
start 01_trigger

insert into tq84_table_with_trigger (col_1) values (1);
commit;
select * from tq84_table_with_trigger;

host exp tables=(tq84_table_with_trigger) 

drop table tq84_table_with_trigger;

host imp full=yes

insert into tq84_table_with_trigger (col_1) values (2);
commit;
select * from tq84_table_with_trigger;
