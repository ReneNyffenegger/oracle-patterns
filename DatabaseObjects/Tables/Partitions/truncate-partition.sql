create table tq84_tab (
  period  varchar2(5) not null check (period in ('DAY', 'WEEK', 'MONTH')),
  col_1   number,
  col_2   varchar2(10)
)
partition by list (period) (
  partition tq84_tab_day   values ('DAY'  ),
  partition tq84_tab_week  values ('WEEK' ),
  partition tq84_tab_month values ('MONTH')
);

insert into tq84_tab values ('DAY'  , 4, 'four'  );
insert into tq84_tab values ('WEEK' , 9, 'nine'  );
insert into tq84_tab values ('MONTH',11, 'eleven');

alter table tq84_tab truncate partition tq84_tab_week;

select * from tq84_tab;
-- PERIO      COL_1 COL_2
-- ----- ---------- ----------
-- DAY            4 four
-- MONTH         11 eleven

drop table tq84_tab purge;
