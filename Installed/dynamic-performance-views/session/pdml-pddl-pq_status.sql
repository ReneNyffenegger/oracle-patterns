alter session disable parallel ddl;
alter session disable parallel dml;
alter session disable parallel query;



select
  pdml_enabled,
  pdml_status,
  pddl_status,
  pq_status
from
  v$session where sid = sys_context('userenv', 'sid');
--
-- PDM PDML_STA PDDL_STA PQ_STATU
-- --- -------- -------- --------
-- NO  DISABLED DISABLED DISABLED



alter session enable parallel query;


select
  pdml_enabled,
  pdml_status,
  pddl_status,
  pq_status
from
  v$session where sid = sys_context('userenv', 'sid');
-- PDM PDML_STA PDDL_STA PQ_STATU
-- --- -------- -------- --------
-- NO  DISABLED DISABLED ENABLED




alter session enable parallel ddl;

select
  pdml_enabled,
  pdml_status,
  pddl_status,
  pq_status
from
  v$session where sid = sys_context('userenv', 'sid');
--
-- PDM PDML_STA PDDL_STA PQ_STATU
-- --- -------- -------- --------
-- NO  DISABLED ENABLED  ENABLED




alter session enable parallel dml;

select
  pdml_enabled,
  pdml_status,
  pddl_status,
  pq_status
from
  v$session where sid = sys_context('userenv', 'sid');
--
-- PDM PDML_STA PDDL_STA PQ_STATU
-- --- -------- -------- --------
-- YES ENABLED  ENABLED  ENABLED
