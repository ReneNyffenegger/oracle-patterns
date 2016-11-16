create table tq84_dml_lock_test (
  pk number primary key
);

select * from dba_dml_locks;

insert into tq84_dml_lock_test values (1);

select
  mode_held,
  mode_requested,
--last_convert       currend_mode_granted_secs_ago,     
  blocking_others
from
  dba_dml_locks
where
  owner = user;
--
-- Row-X (SX)	None	Not Blocking
-- 

drop table tq84_dml_lock_test purge;
