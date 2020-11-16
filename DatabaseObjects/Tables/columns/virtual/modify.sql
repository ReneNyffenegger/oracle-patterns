create table tq84_virtual_col (
  a  number,
  b  number,
  c  as (a + b)
);


insert into tq84_virtual_col (a, b) values (1,1);
insert into tq84_virtual_col (a, b) values (4,3);
insert into tq84_virtual_col (a, b) values (2,7);

select * from tq84_virtual_col;

alter table tq84_virtual_col modify c as (a*b);

select * from tq84_virtual_col;

drop table tq84_virtual_col purge;
