create table tq84_analytical_group_by (
       item    varchar2(10),
       val     number
);


insert into tq84_analytical_group_by values ('abc',   10);
insert into tq84_analytical_group_by values ('abc',   15);
insert into tq84_analytical_group_by values ('abc',   20);

insert into tq84_analytical_group_by values ('DEF',    7);
insert into tq84_analytical_group_by values ('DEF',   12);

insert into tq84_analytical_group_by values ('123',    7);
insert into tq84_analytical_group_by values ('123',    8);
insert into tq84_analytical_group_by values ('123',   14);

select
  item,
  sum(val),
  sum(sum(val)) over () val_total,
  max(sum(val)) over () val_max
from
  tq84_analytical_group_by
group by
  item;


drop table tq84_analytical_group_by;
