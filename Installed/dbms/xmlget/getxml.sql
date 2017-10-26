create table tq84_table (
  id    number primary key,
  col_1 varchar2(10),
  col_2 date
);

insert into tq84_table values (1, 'one'  , date '1905-05-23');
insert into tq84_table values (2, 'two'  , date '1875-02-16');
insert into tq84_table values (3, 'three', date '1897-09-29');
insert into tq84_table values (4, 'four' , date '2017-11-17');

commit;
select
  dbms_xmlgen.getxml('
     select * from tq84_table
  ') xml
from
  dual;
/*
<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <ID>1</ID>
  <COL_1>one</COL_1>
  <COL_2>23.05.1905 00:00:00</COL_2>
 </ROW>
 <ROW>
  <ID>2</ID>
  <COL_1>two</COL_1>
  <COL_2>16.02.1875 00:00:00</COL_2>
 </ROW>
 <ROW>
  <ID>3</ID>
  <COL_1>three</COL_1>
  <COL_2>29.09.1897 00:00:00</COL_2>
 </ROW>
 <ROW>
  <ID>4</ID>
  <COL_1>four</COL_1>
  <COL_2>17.11.2017 00:00:00</COL_2>
 </ROW>
</ROWSET>
*/

drop   table tq84_table;
