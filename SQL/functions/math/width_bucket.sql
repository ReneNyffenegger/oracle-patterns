create table tq84_hist (
   v  number
);


insert into tq84_hist
select * from table(sys.dbms_debug_vc2coll(
--  0-6  7-13  14-20  21-27  28-34  35-41  42-48  49-55
--  ---  ----  -----  -----  -----  -----  -----  -----
                  16,
                  20,           29,
                  17,    27,    28,
                  19,    21,    34,
      3,          14,    26,    33,    35,    44,
      1,   11,    14,    21,    29,    38,    43,    55,
      4,   12,    18,    22,    32,    35,    48,    50
));

-- select * from tq84_hist;


column bucket format a10
column s      format 99

select
  ( bucket_no    * 7    ) || '-' ||
  ((bucket_no+1) * 7 -1 )            bucket,
    sum(1)     s
from (
  select
    width_bucket(v, 0, 56, 8)  bucket_no
  from
    tq84_hist
)
group by bucket_no
order by bucket_no
;
-- 
-- BUCKET       S
-- ---------- ---
-- 7-13         3
-- 14-20        2
-- 21-27        7
-- 28-34        5
-- 35-41        6
-- 42-48        3
-- 49-55        3
-- 56-62        2


column t format a10

select
  ( bucket_no    * 7    ) || '-' ||
  ((bucket_no+1) * 7 -1 )            bucket,
   lpad('o', sum(1), 'o')    t
from (
  select
    width_bucket(v, 0, 56, 8)  bucket_no
  from
    tq84_hist
)
group by bucket_no
order by bucket_no
;
-- 
-- BUCKET     T
-- ---------- ----------
-- 7-13       ooo
-- 14-20      oo
-- 21-27      ooooooo
-- 28-34      ooooo
-- 35-41      oooooo
-- 42-48      ooo
-- 49-55      ooo
-- 56-62      oo

drop table tq84_hist purge;
