declare
  v  varchar2(100); 
begin

  for c in (
    select 'type_operations'        n from dual union all
    select 'type_rejected_records'  n from dual union all
    select 'type_dimension_compile' n from dual union all 
    select 'type_build'             n from dual
  ) loop


    execute immediate 'begin :v := dbms_cube_log.default_name(dbms_cube_log.' || c.n || '); end;' using out v;

    dbms_output.put_line(rpad(c.n || ': ', 26) || v);

  end loop;


end;
/

-- type_operations:          CUBE_OPERATIONS_LOG
-- type_rejected_records:    CUBE_REJECTED_RECORDS
-- type_dimension_compile:   CUBE_DIMENSION_COMPILE
-- type_build:               CUBE_BUILD_LOG
