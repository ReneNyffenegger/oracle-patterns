--
--  Compare with 2dim.sql
--
create table tq84_2dim_fill_holes (
   dt    date        ,  -- 1st dimenstion: a date
   item  varchar2(10),  -- 2nd dimenstion
   val   number
);


insert into tq84_2dim_fill_holes values (date '2000-01-01', 'ABC', 10);
insert into tq84_2dim_fill_holes values (date '2000-01-01', 'def', 18);
insert into tq84_2dim_fill_holes values (date '2000-01-01', '***',  9);

insert into tq84_2dim_fill_holes values (date '2000-01-02', 'ABC',  2);
insert into tq84_2dim_fill_holes values (date '2000-01-02', 'def',  8);
insert into tq84_2dim_fill_holes values (date '2000-01-02', '???', 11);

insert into tq84_2dim_fill_holes values (date '2000-01-03', 'ABC',  1);
insert into tq84_2dim_fill_holes values (date '2000-01-03', 'def',  0);
insert into tq84_2dim_fill_holes values (date '2000-01-03', '***', 22);
insert into tq84_2dim_fill_holes values (date '2000-01-03', '???', 17);

with x as (
  select /*+ materialize */
    dt,
    item,
    sum      (val )   sum_val,
    --
    grouping (dt  )   dt_is_grouped,
    grouping (item)   item_is_grouped
  from
    tq84_2dim_fill_holes
  group by
    cube(dt, item)
  order by
    dt,
    item,
    grouping(dt  ),
    grouping(item)
),
dim1 as ( select distinct dt   from x),
dim2 as ( select distinct item from x)
--
select
  dim1.dt,
  dim2.item,
  nvl(x   .sum_val          , 0) sum_val,
  nvl(x   .dt_is_grouped    , 0) dt_is_grouped,
  nvl(x   .item_is_grouped  , 0) item_is_grouped
from
  dim1 cross join dim2 left join
  x    on   (dim1.dt   = x.dt   or dim1.dt   is null and x.dt   is null) and
            (dim2.item = x.item or dim2.item is null and x.item is null)
order by
  dim2.item nulls last,
  dim1.dt   nulls last 
--nvl(x.item_is_grouped, 0),
--  nvl(x.dt_is_grouped  , 0)
  ;


select
  all_dts.dt,
  all_items.item,
  sum      (val ),
  --
  grouping (all_dts.dt  ),
  grouping (all_items.item)
from
  (select distinct dt from tq84_2dim_fill_holes) all_dts
  join (select distinct item from tq84_2dim_fill_holes) all_items on 1=1
  left join tq84_2dim_fill_holes
    on tq84_2dim_fill_holes.dt = all_dts.dt
    and tq84_2dim_fill_holes.item = all_items.item
group by
  cube(all_dts.dt, all_items.item)
order by
  all_dts.dt,
  all_items.item,
  grouping(all_dts.dt  ),
  grouping(all_items.item);


drop table tq84_2dim_fill_holes purge;
