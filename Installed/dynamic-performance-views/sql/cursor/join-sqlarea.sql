select
   cur.status,
   cur.child_pin,
   cur.pers_heap_mem,
   cur.work_heap_mem,
   cur.bind_vars,
   sql.sql_text
from
   v$sql_cursor cur                                         join
   v$sqlarea    sql on cur.parent_handle = sql.address
;
