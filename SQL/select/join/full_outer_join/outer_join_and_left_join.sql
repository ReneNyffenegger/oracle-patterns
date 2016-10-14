create table tq84_lookup (
  id    number       primary key,
  txt   varchar2(10)
);

insert into tq84_lookup values (1, 'one');
insert into tq84_lookup values (2, 'two');
insert into tq84_lookup values (3, 'three');
insert into tq84_lookup values (4, 'four');
insert into tq84_lookup values (5, 'five');
insert into tq84_lookup values (6, 'six');

create table tq84_items (
  id_set    number,
  id_lookup number not null references tq84_lookup,
  txt       varchar2(10),
  primary key (id_set, id_lookup)
);

insert into tq84_items values (1, 1, '#');
insert into tq84_items values (1, 2, '?');

insert into tq84_items values (2, 2, '_');
insert into tq84_items values (2, 6, '!');

insert into tq84_items values (3, 2, 'abc');
insert into tq84_items values (3, 3, 'def');
insert into tq84_items values (3, 4, 'ghi');

insert into tq84_items values (4, 2, 'FOO');
insert into tq84_items values (4, 3, 'BAR');
insert into tq84_items values (4, 5, 'BAZ');

with i_3 as (select * from tq84_items where id_set = 3),
     i_4 as (select * from tq84_items where id_set = 4)
select
  nvl(i_3.id_lookup, i_4.id_lookup) id,
  nvl(l_3.txt      , l_4.txt      ) txt_lookup,
  i_3.txt                           txt_lookup_3,
  i_4.txt                           txt_lookup_4
from
  i_3                                               full outer join
  i_4             on i_3.id_lookup = i_4.id_lookup       left  join
  tq84_lookup l_3 on i_3.id_lookup = l_3.id              left  join
  tq84_lookup l_4 on i_4.id_lookup = l_4.id
;

drop table tq84_items  purge;
drop table tq84_lookup purge;

