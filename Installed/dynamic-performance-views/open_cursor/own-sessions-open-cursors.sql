select
  opc.user_name,
--mon.username,
--mon.module,
  opc.sql_id,
  opc.sql_exec_id,
--mon.status,
  opc.sql_text,
  opc.last_sql_active_time,
  opc.cursor_type
from
  v$session        ses                                       join
  v$open_cursor    opc on ses.sid          = opc.sid /* left join
  v$sql_monitor    mon on opc.sql_exec_id  = mon.key */
where
  ses.audsid = sys_context('userenv', 'sessionid')
order by
  decode (opc.user_name, 'SYS', 1, 0);
