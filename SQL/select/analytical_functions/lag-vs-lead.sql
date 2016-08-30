create table tq84_lag_vs_lead (
  a number,
  t varchar2(10)
);

insert into tq84_lag_vs_lead values (1, 'one'  );
insert into tq84_lag_vs_lead values (2, 'two'  );
insert into tq84_lag_vs_lead values (3, 'three');
insert into tq84_lag_vs_lead values (4, 'four' );
insert into tq84_lag_vs_lead values (5, 'five' );


select
  t,
  lead(t   ) over (order by a) lead_1,
  lag (t   ) over (order by a) lag_1,
  lead(t, 3) over (order by a) lead_3,
  lag (t, 3) over (order by a) lag_3
from
  tq84_lag_vs_lead;

drop table tq84_lag_vs_lead purge;
