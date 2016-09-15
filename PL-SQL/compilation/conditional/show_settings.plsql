alter session set plsql_ccflags='TQ84_BOOL:true,TQ84_NUM:42';

create package tq84_package as
  procedure do;
end tq84_package;
/

create package body tq84_package as
  procedure do is
  begin

    $if $$tq84_bool $then
        dbms_output.put_line('yes');
    $else
        dbms_output.put_line('no');
    $end

    dbms_output.put_line('The num is: ' || $$tq84_num);

  end do;
end tq84_package;
/

exec tq84_package.do

column type          format a12
column name          format a20
column plsql_ccflags format a30

select
  type,
  name,
  plsql_ccflags
--plsql_optimize_level,
--plsql_code_type,
--plsql_warnings,
--nls_length_semantics,
--plscope_settings
from
  user_plsql_object_settings
where
  name = 'TQ84_PACKAGE'
;

drop package tq84_package;
