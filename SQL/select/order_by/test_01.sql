create table tq84_order_by (
  txt   varchar2(10),
  value number
);

insert into tq84_order_by values ('seven',    7);
insert into tq84_order_by values ('nine' ,    9);
insert into tq84_order_by values ('five' ,    5);
insert into tq84_order_by values ('eight',    8);
insert into tq84_order_by values ('two'  ,    2);
insert into tq84_order_by values ('foo'  , null);
insert into tq84_order_by values ('four' ,    4);
insert into tq84_order_by values ('three',    3);
insert into tq84_order_by values ('six'  ,    6);
insert into tq84_order_by values ('one'  ,    1);

select * from tq84_order_by order by value desc nulls last;

drop table tq84_order_by;
