create type tq84_obj as object (
  foo varchar2(10),
  bar number,
  baz date,
  member procedure proc
);
/

column attr_name      format a10
column attr_type_name format a10
select
  attr_name,
  attr_type_mod,
  attr_type_name,
  length
from
  user_type_attrs
where
  type_name = 'TQ84_OBJ'
order by
  attr_no;
--
-- ATTR_NAME  ATTR_TY ATTR_TYPE_     LENGTH
-- ---------- ------- ---------- ----------
-- FOO                VARCHAR2           10
-- BAR                NUMBER
-- BAZ                DATE


drop type tq84_obj;
