create table tq84_stock_price (
  company varchar2(5),
  dt      number,
  price   number
);



insert into tq84_stock_price values ('ABC',  1,   7);
insert into tq84_stock_price values ('ABC',  2,   9);
insert into tq84_stock_price values ('ABC',  3,  10);
insert into tq84_stock_price values ('ABC',  4,  10);
insert into tq84_stock_price values ('ABC',  5,  11);
insert into tq84_stock_price values ('ABC',  6,   8);
insert into tq84_stock_price values ('ABC',  7,   7);
insert into tq84_stock_price values ('ABC',  8,   6);
insert into tq84_stock_price values ('ABC',  9,   6);
insert into tq84_stock_price values ('ABC', 10,   8);
insert into tq84_stock_price values ('ABC', 11,   9);

insert into tq84_stock_price values ('DEF',  1,   6);
insert into tq84_stock_price values ('DEF',  2,   5);
insert into tq84_stock_price values ('DEF',  3,   7);
insert into tq84_stock_price values ('DEF',  4,   8);
insert into tq84_stock_price values ('DEF',  5,  10);
insert into tq84_stock_price values ('DEF',  6,   9);
insert into tq84_stock_price values ('DEF',  7,  10);
insert into tq84_stock_price values ('DEF',  8,  12);
insert into tq84_stock_price values ('DEF',  9,   7);
insert into tq84_stock_price values ('DEF', 10,   8);
insert into tq84_stock_price values ('DEF', 11,   9);

insert into tq84_stock_price values ('GHI',  1,   9);
insert into tq84_stock_price values ('GHI',  2,   8);
insert into tq84_stock_price values ('GHI',  3,   7);
insert into tq84_stock_price values ('GHI',  4,   6);
insert into tq84_stock_price values ('GHI',  5,   7);
insert into tq84_stock_price values ('GHI',  6,   8);
insert into tq84_stock_price values ('GHI',  7,   7);
insert into tq84_stock_price values ('GHI',  8,   6);
insert into tq84_stock_price values ('GHI',  9,   7);
insert into tq84_stock_price values ('GHI', 10,   8);
insert into tq84_stock_price values ('GHI', 11,   7);


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
;


--
-- NOTE: ABC is not reported at all because
--       the price at dt=1 is not recognized as
--       bottom date, nor is the price at dt=11 recognized
--       as top date.
--  
--
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
      up   as up.price > prev(up.price)
  ) mr
order by
  mr.company,
  mr.start_dt
;


drop table tq84_stock_price purge;
