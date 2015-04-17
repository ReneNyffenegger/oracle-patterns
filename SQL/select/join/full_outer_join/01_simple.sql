create table tq84_foj_a (
  id_a   number,
  txt_a  varchar2(10)
);

create table tq84_foj_b (
  id_b   number,
  txt_b  varchar2(10)
);

insert into tq84_foj_a values (1, 'abc');
insert into tq84_foj_a values (2, 'def');
insert into tq84_foj_a values (3, 'ghi');

insert into tq84_foj_b values (2, 'FOO');
insert into tq84_foj_b values (4, 'BAR');

select
  coalesce(a.id_a, b.id_b) id,
  a.txt_a,
  b.txt_b
from
  tq84_foj_a a full outer join
  tq84_foj_b b                   on id_a = id_b;

drop table tq84_foj_a purge;
drop table tq84_foj_b purge;
