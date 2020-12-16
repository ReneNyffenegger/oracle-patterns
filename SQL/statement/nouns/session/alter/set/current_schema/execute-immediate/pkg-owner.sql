create package PKG_DEFINER
   authid definer
as
   procedure do_something;
end;
/

create package body PKG_DEFINER
as
   procedure do_something as
   begin

      execute immediate q'{
          begin
             dbms_output.put_line('exec immediate: current schema before setting current_schema: ' || sys_context('userenv', 'current_schema'));
             execute immediate 'alter session set current_schema = pkg_user';
             dbms_output.put_line('exec immediate: current schema after  setting current_schema: ' || sys_context('userenv', 'current_schema'));
          end;
      }';

   --
   -- Turns out, the alter session set current_schema in the
   -- previous execute immediate affects only the statement being
   -- executed in the execute statement. It does not change
   -- the enclosing scope.
   --
      dbms_output.put_line('current schema after execute immediate:                       ' || sys_context('userenv', 'current_schema'));

   end do_something;
end pkg_definer;
/

show errors
grant execute on pkg_definer to pkg_user;
