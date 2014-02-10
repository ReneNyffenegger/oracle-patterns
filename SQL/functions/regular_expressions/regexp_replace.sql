create table tq84_regexp_replace (
  col_1    varchar2(10)
);

insert into tq84_regexp_replace values ('A204#904');
insert into tq84_regexp_replace values ('B9289390');
insert into tq84_regexp_replace values ('A501abcd');


column digits   format a30
column alnums   format a30

select
  regexp_replace(col_1, 'A(\d*).*','\1') digits,
  regexp_replace(col_1, 'A(\w*).*','\1') alnums
from
  tq84_regexp_replace;

drop table tq84_regexp_replace purge;
