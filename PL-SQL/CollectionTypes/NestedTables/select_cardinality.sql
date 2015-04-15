create type tq84_obj as object (
   a   number,
   b   varchar2(10)
);
/

create type tq84_obj_t as table of tq84_obj;
/


create table tq84_table (
  id     number,
  obj_t  tq84_obj_t
)
nested table obj_t store as tq84_table_t;


insert into tq84_table values (1, tq84_obj_t(tq84_obj(1, 'one' ), tq84_obj(2, 'two' )                     ));
insert into tq84_table values (2, tq84_obj_t(tq84_obj(1, 'eins'), tq84_obj(2, 'zwei'), tq84_obj(3, 'drei')));

select
  t.id,
  cardinality(t.obj_t)
from
  tq84_table     t;



drop table tq84_table;
drop type tq84_obj_t;
drop type tq84_obj;
