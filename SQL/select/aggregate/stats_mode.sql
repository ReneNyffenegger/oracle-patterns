create table tq84_stats_mode (
  val number
);

insert into tq84_stats_mode values (     1);
insert into tq84_stats_mode values (     2);
insert into tq84_stats_mode values (     3);
insert into tq84_stats_mode values (    42);
insert into tq84_stats_mode values (     2);
insert into tq84_stats_mode values (   999);
insert into tq84_stats_mode values (    42);
insert into tq84_stats_mode values (    42);
insert into tq84_stats_mode values (     3);


-- Which value occurs the most?
select
  stats_mode(val)
from
  tq84_stats_mode;
-- 
-- STATS_MODE(VAL)
-- ---------------
--              42

select
  count(*),
  val
from
  tq84_stats_mode
group by
  val
order by count(*) desc
fetch first row only;
-- 
--   COUNT(*)        VAL
-- ---------- ----------
--          3         42

drop table tq84_stats_mode;
