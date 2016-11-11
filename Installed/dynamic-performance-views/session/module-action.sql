begin

  dbms_application_info.set_module (
    module_name => 'tq84_module',
    action_name => 'tq84_action'
  );

end;
/

select
  sid,
  to_number(sys_context('userenv', 'sid')) sid_verify,
  action
from
  v$session
where
  module = 'tq84_module';
