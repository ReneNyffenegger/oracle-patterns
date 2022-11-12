column abc format a20
column def format a20
column ghi format a20

select
  dt,
  max(lpad('o', case when company = 'ABC' then price end))  abc,
  max(lpad('o', case when company = 'DEF' then price end))  def,
  max(lpad('o', case when company = 'GHI' then price end))  ghi
from
  tq84_stock_price
group by
  dt
order by
  dt
--
--  DT ABC                  DEF                  GHI
-- --- -------------------- -------------------- --------------------
--   1       o                   o                       o
--   2         o                o                       o
--   3          o                 o                    o
--   4          o                  o                  o
--   5           o                   o                 o
--   6        o                     o                   o
--   7       o                       o                 o
--   8      o                          o              o
--   9      o                     o                    o
--  10        o                    o                    o
--  11         o                    o                  o
;
