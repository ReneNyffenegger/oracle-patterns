create type tq84_obj as object (
   a   number,
   b   varchar2(10)
);
/

create type tq84_obj_t as table of tq84_obj;
/


create table tq84_table (
  id         number,
  obj_t_1    tq84_obj_t,
  obj_t_2    tq84_obj_t
)
nested table obj_t_1 store as tq84_table_t_1,
nested table obj_t_2 store as tq84_table_t_2;

insert into tq84_table values (1,
  tq84_obj_t(tq84_obj(1, 'one' ), tq84_obj(2, 'two' )                     ),
  tq84_obj_t(tq84_obj(1, 'eins'), tq84_obj(2, 'zwei'), tq84_obj(3, 'drei'))
);

insert into tq84_table values (2,
  tq84_obj_t(tq84_obj(42, 'foo' )),
  tq84_obj_t(                   ))
);

insert into tq84_table values (3,
  tq84_obj_t(tq84_obj(98, 'X'   )),
  tq84_obj_t(tq84_obj(99, 'Y'   ))
);

select t.id, u.a, u.b, v.a, v.b from
  tq84_table t,
  the(select t.obj_t_1 from tq84_table u where u.id = t.id) u,
  the(select t.obj_t_2 from tq84_table v where v.id = t.id) v;

drop table tq84_table;
drop type tq84_obj_t;
drop type tq84_obj;


