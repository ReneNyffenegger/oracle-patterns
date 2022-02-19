select *
from
  tq84_stock_price
  match_recognize (
    partition by company
    order     by dt
    measures
             strt.dt  as start_dt,
      last  (down.dt) as bottom_dt,
      last  (up  .dt) as top_dt
    one row per match
    after match skip to last up
    pattern (strt down+ up+)
    define
      down as down.price < prev(down.price),
      up   as up  .price > prev(up  .price)
  ) mr
order by
  mr.company,
  mr.start_dt
;
--
-- COMPA   START_DT  BOTTOM_DT     TOP_DT
-- ----- ---------- ---------- ----------
-- DEF            1          2          5
-- DEF            5          6          8
-- DEF            8          9         11
-- GHI            1          4          6
-- GHI            6          8         10
