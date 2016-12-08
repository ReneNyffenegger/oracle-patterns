create type tq84_obj as object (
  a number,
  b varchar2(10)
);
/

create type tq84_obj_t as table of tq84_obj;
/

create type tq84_obj_t_t as table of tq84_obj_t;
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

select
--t.id,
  t1.a,
  t2.a
--cast (powermultiset_by_cardinality(val, 3) as tq84_obj_t_t)
from
  tq84_tab t,
  table(powermultiset_by_cardinality(t.val, 3)) tt,
  table(tt.column_value) t1,
  table(tt.column_value) t2
where
  t.id = '2-5';
-- 
--          A          A
-- ---------- ----------
--          2          2
--          2          3
--          2          4
--          3          2
--          3          3
--          3          4
--          4          2
--          4          3
--          4          4
--          2          2
--          2          3
--          2          5
--          3          2
--          3          3
--          3          5
--          5          2
--          5          3
--          5          5
--          2          2
--          2          4
--          2          5
--          4          2
--          4          4
--          4          5
--          5          2
--          5          4
--          5          5
--          3          3
--          3          4
--          3          5
--          4          3
--          4          4
--          4          5
--          5          3
--          5          4
--          5          5



drop table tq84_tab;


begin -- Why is that even necessary???

  for r in (select name from user_dependencies where referenced_name = 'TQ84_OBJ_T') loop
    dbms_output.put_line('dropping ' || r.name);
    execute immediate 'drop type "' || r.name || '"';
  end loop;

end;
/


drop type  tq84_obj_t;
drop type  tq84_obj;
