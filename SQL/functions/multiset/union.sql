create type tq84_obj as object (
  a number,
  b varchar2(10)
);
/

create type tq84_obj_t as table of tq84_obj;
/

create table tq84_tab (
  id  varchar2(10),
  val tq84_obj_t
)
nested table val store as tq84_tab_val;

insert into tq84_tab values ('1-3', tq84_obj_t(tq84_obj(1, 'one' ), tq84_obj(2, 'two'  ), tq84_obj(3, 'three')                      ));
insert into tq84_tab values ('2-5', tq84_obj_t(tq84_obj(2, 'two' ), tq84_obj(3, 'three'), tq84_obj(4, 'four' ), tq84_obj(5, 'five' )));
insert into tq84_tab values ('4'  , tq84_obj_t(tq84_obj(4, 'four')                                                                  ));
insert into tq84_tab values ('n/a', tq84_obj_t(                                                                                     ));


break on what skip 1

select
  a.id || ' \/ ' || b.id what,
  t.*
from
  tq84_tab a,
  tq84_tab b,
  table(a.val multiset union b.val) t
where
  a.id = '1-3' and b.id = '2-5' or
  a.id = '2-5' and b.id = '4'   or
  a.id = '4'   and b.id = 'n/a';
-- 
-- WHAT                              A B
-- ------------------------ ---------- ----------
-- 1-3 \/ 2-5                        1 one
--                                   2 two
--                                   3 three
--                                   2 two
--                                   3 three
--                                   4 four
--                                   5 five
-- 
-- 2-5 \/ 4                          2 two
--                                   3 three
--                                   4 four
--                                   5 five
--                                   4 four
-- 
-- 4 \/ n/a                          4 four


drop table tq84_tab;
drop type  tq84_obj_t;
drop type  tq84_obj;
