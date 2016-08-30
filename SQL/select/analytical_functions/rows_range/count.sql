create table tq84_table (
  part    varchar2(3),
  val     number
);

insert into tq84_table values ('bar',    2);
insert into tq84_table values ('bar',    3);
insert into tq84_table values ('bar',   10);
insert into tq84_table values ('bar',  100);

insert into tq84_table values ('baz',   50);
insert into tq84_table values ('baz',   60);
insert into tq84_table values ('baz',   70);
insert into tq84_table values ('baz',   72);

insert into tq84_table values ('foo',    1);
insert into tq84_table values ('foo',    3);
insert into tq84_table values ('foo',    6);
insert into tq84_table values ('foo',   10);
insert into tq84_table values ('foo',   11);
insert into tq84_table values ('foo',   12);
insert into tq84_table values ('foo',   13);
insert into tq84_table values ('foo',   20);


select
  part,
  val,
  count(*) over (partition by part order by val rows  between 2 preceding and 2 following) c_rows,
  count(*) over (partition by part order by val range between 2 preceding and 2 following) c_range
from
  tq84_table;



drop table tq84_table purge;
