create table tq84_group_by_cube_2dim (
   dt    date        ,  -- 1st dimenstion: a date
   item  varchar2(10),  -- 2nd dimenstion
   val   number
);


insert into tq84_group_by_cube_2dim values (date '2000-01-01', 'ABC', 10);
insert into tq84_group_by_cube_2dim values (date '2000-01-01', 'def', 18);
insert into tq84_group_by_cube_2dim values (date '2000-01-01', '***',  9);

insert into tq84_group_by_cube_2dim values (date '2000-01-02', 'ABC',  2);
insert into tq84_group_by_cube_2dim values (date '2000-01-02', 'def',  8);
insert into tq84_group_by_cube_2dim values (date '2000-01-02', '???', 11);

insert into tq84_group_by_cube_2dim values (date '2000-01-03', 'ABC',  1);
insert into tq84_group_by_cube_2dim values (date '2000-01-03', 'def',  0);
insert into tq84_group_by_cube_2dim values (date '2000-01-03', '***', 22);
insert into tq84_group_by_cube_2dim values (date '2000-01-03', '???', 17);

-- Unfortunately, the result set does not indicate that
-- the combination of 2000-01-02 / *** does not have a value.
-- See 2dim_fill_holes.sql instead.

select
  dt,
  item,
  sum      (val ),
  --
  grouping (dt  ),
  grouping (item)
from
  tq84_group_by_cube_2dim
group by
  cube(dt, item)
order by
  dt,
  item,
  grouping(dt  ),
  grouping(item);


drop table tq84_group_by_cube_2dim purge;
