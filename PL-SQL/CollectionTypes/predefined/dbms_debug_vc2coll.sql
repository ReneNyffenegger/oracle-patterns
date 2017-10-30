select
  t.column_value
from
  table(sys.dbms_debug_vc2coll('foo', 'bar', 'baz')) t;
