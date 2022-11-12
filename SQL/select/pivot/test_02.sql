create table tq84_pivot (
  dt          date,
  txt         varchar2(10),
  value1      number(5,2),
  value2      number(5,2)
);


insert into tq84_pivot values (date '2000-08-10',  'Item 1',  10,  9);
insert into tq84_pivot values (date '2000-09-12',  'Item 1',  12, 11);
insert into tq84_pivot values (date '2000-09-15',  'Item 1',  14, 13);
insert into tq84_pivot values (date '2000-09-16',  'Item 1',   2,  1);

insert into tq84_pivot values (date '2000-07-02',  'Item 2',  11, 10);
insert into tq84_pivot values (date '2000-07-05',  'Item 2',   7,  6);
insert into tq84_pivot values (date '2000-08-22',  'Item 2',   8,  7);

insert into tq84_pivot values (date '2000-08-22',  'Item 3',   6,  5);
insert into tq84_pivot values (date '2000-09-23',  'Item 3',1000,  5);

with translate_dt_to_month as (
  select to_char(dt, 'MM') month, txt, value1, value2 from tq84_pivot
)
select * from translate_dt_to_month
  --
  pivot ( sum(value1) sum_1, sum(value2) sum_2 for month in ('07', '08', '09') )
  --
order by txt;
--
-- TXT        '07'_SUM_1 '07'_SUM_2 '08'_SUM_1 '08'_SUM_2 '09'_SUM_1 '09'_SUM_2
-- ---------- ---------- ---------- ---------- ---------- ---------- ----------
-- Item 1                                   10          9         28         25
-- Item 2             18         16          8          7
-- Item 3                                    6          5

drop table tq84_pivot;
