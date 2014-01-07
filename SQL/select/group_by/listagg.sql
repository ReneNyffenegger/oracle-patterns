create table tq84_listagg (
  id    number,
  txt   varchar2(10)
);

insert into tq84_listagg values (1, 'one' );
insert into tq84_listagg values (1, 'eins');
insert into tq84_listagg values (1, 'un'  );

insert into tq84_listagg values (2, 'two' );
insert into tq84_listagg values (2, 'duo' );

insert into tq84_listagg values (3, 'three');
insert into tq84_listagg values (3, 'tres' );
insert into tq84_listagg values (3, 'trois');
insert into tq84_listagg values (3, 'drei' );

column txt_  format a40

select
  id,
  listagg(txt, '-') within group (order by txt) as txt_
from
  tq84_listagg
group by
  id;

drop table tq84_listagg purge;
