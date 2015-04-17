create table tq84_foj (
  id_1    number,
  id_2    number,
  txt     varchar2(10)
);

insert into tq84_foj values (1, 1, '#');
insert into tq84_foj values (1, 2, '?');

insert into tq84_foj values (2, 1, 'abc');
insert into tq84_foj values (2, 2, 'def');
insert into tq84_foj values (2, 3, 'ghi');

insert into tq84_foj values (3, 2, 'FOO');
insert into tq84_foj values (3, 4, 'BAR');


select
  a.id_1,
  b.id_1,
  a.txt,
  b.txt
from
  tq84_foj a full outer join
  tq84_foj b on a.id_2 = b.id_2 and
                a.id_1 = 2      and
                b.id_1 = 3;

with a as (select * from tq84_foj where id_1 = 2),
     b as (select * from tq84_foj where id_1 = 3)
select
  a.id_1,
  b.id_1,
  a.txt,
  b.txt
from
  a full outer join b on a.id_2 = b.id_2;

drop table tq84_foj purge;
