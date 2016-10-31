-- The »own« session can be found with sys_context with two possibilities:

select * from v$session where sid    = sys_context('userenv', 'sid'      );
select * from v$session where audsid = sys_context('userenv', 'sessionid');
