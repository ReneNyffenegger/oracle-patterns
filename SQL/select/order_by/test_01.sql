create table tq84_order_by (
  txt   varchar2(10),
  value number
);

insert into tq84_order_by values ('two'  ,    2);
insert into tq84_order_by values ('null' , null);
insert into tq84_order_by values ('four' ,    4);
insert into tq84_order_by values ('three',    3);
insert into tq84_order_by values ('one'  ,    1);

select * from tq84_order_by order by value;
-- TXT             VALUE
-- ---------- ----------
-- one                 1
-- two                 2
-- three               3
-- four                4
-- null

select * from tq84_order_by order by value nulls first;
-- TXT             VALUE
-- ---------- ----------
-- null
-- one                 1
-- two                 2
-- three               3
-- four                4

select * from tq84_order_by order by value desc;
-- TXT             VALUE
-- ---------- ----------
-- null
-- four                4
-- three               3
-- two                 2
-- one                 1

select * from tq84_order_by order by value desc nulls last;
-- TXT             VALUE
-- ---------- ----------
-- four                4
-- three               3
-- two                 2
-- one                 1
-- null

drop table tq84_order_by purge;
