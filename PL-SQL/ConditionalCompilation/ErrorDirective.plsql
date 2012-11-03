prompt create package
create or replace package tq84_error_directive as


  $IF $$FLAG_VERSION_ERROR $THEN
      $ERROR  'At least version 4 required' $END
  $END

end;
/
show errors

prompt alter session
alter session set plsql_ccflags = 'FLAG_VERSION_ERROR:true';

prompt recompile package
alter package tq84_error_directive compile;
show errors package tq84_error_directive;
