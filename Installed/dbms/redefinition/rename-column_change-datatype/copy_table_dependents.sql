declare
   cnt_errors binary_integer;
begin

  dbms_redefinition.copy_table_dependents(
     uname            => user,
     orig_table       =>'tq84_redefinition',
     int_table        =>'tq84_redefinition_int',
     copy_indexes     => dbms_redefinition.cons_orig_params,
     copy_triggers    => true,
     copy_constraints => true,
     copy_privileges  => true,
     ignore_errors    => false,
     num_errors       => cnt_errors,
     copy_statistics  => true,
     copy_mvlog       => false);

  if cnt_errors > 0 then
     dbms_output.put_line('There were ' || cnt_errors || ' errors.');
  end if;

end;
/

