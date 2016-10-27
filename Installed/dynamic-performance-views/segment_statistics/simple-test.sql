create table tq84_segment_statistic (
  a varchar2(4000),
  b varchar2(4000),
  c varchar2(4000),
  d varchar2(4000),
  e varchar2(4000),
  f varchar2(4000),
  g varchar2(4000),
  h varchar2(4000),
  i varchar2(4000),
  j varchar2(4000)
);

insert into tq84_segment_statistic values (
  lpad('x', 4000),
  lpad('x', 4000),
  lpad('x', 4000),
  lpad('x', 4000),
  lpad('x', 4000),
  lpad('x', 4000),
  lpad('x', 4000),
  lpad('x', 4000),
  lpad('x', 4000),
  lpad('x', 4000)
);

select
  statistic_name,
  value
from
  v$segment_statistics
where
  owner       = user and
  object_name ='TQ84_SEGMENT_STATISTIC';

drop table tq84_segment_statistic purge;
