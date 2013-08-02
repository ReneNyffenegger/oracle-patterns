create table tq84_nulls_in_aggregate (
  a number,
  b varchar2(10)
);

insert into tq84_nulls_in_aggregate values (null, 'A');
insert into tq84_nulls_in_aggregate values (   1, 'A');
insert into tq84_nulls_in_aggregate values (   2, 'A');

insert into tq84_nulls_in_aggregate values (   3, 'B');
insert into tq84_nulls_in_aggregate values (   4, 'B');
insert into tq84_nulls_in_aggregate values (   5, 'B');

insert into tq84_nulls_in_aggregate values (null, 'C');
insert into tq84_nulls_in_aggregate values (null, 'C');

select 
  sum  (a),
  avg  (a),
  count(a),
  sum  (a) / count(a)  avg_,
  b
from
  tq84_nulls_in_aggregate
group by
  b;

drop table tq84_nulls_in_aggregate purge;
