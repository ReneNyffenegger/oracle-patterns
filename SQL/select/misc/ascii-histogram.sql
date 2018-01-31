create table tq84_normal_dist_of_chars as
select
   c
from (
  select
    chr(ascii('m') + 2.7* dbms_random.normal) c
  from
     dual connect by level < 1000000
)
where
   c between 'a' and 'z'
;


column hist format a100
with hist as (
  select 100 max_width from dual
),
chars as (
  select
    count(*) cnt,
    c
  from
    tq84_normal_dist_of_chars
  group by
    c
)
select
  c,
  lpad('X', chars.cnt / max(chars.cnt) over () * hist.max_width, 'X') hist
from
  chars  cross join
  hist
order by
  c;

--
-- C HIST
-- - ----------------------------------------------------------------------------------------------------
-- a
-- b
-- c
-- d
-- e XX
-- f XXXXX
-- g XXXXXXXXXXXXX
-- h XXXXXXXXXXXXXXXXXXXXXXXXX
-- i XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- j XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- k XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- l XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- m XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- n XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- o XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- p XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- q XXXXXXXXXXXXXXXXXXXXXXXXXX
-- r XXXXXXXXXXXXX
-- s XXXXX
-- t XX
-- u
-- v
-- w
-- x
-- y
-- z 
--


drop table tq84_normal_dist_of_chars purge;
