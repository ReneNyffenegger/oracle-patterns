create package PKG_DEFINER AUTHID DEFINER
as
   procedure do_something;
end;
/

create package PKG_CURRENT_USER AUTHID CURRENT_USER
as
   procedure do_something;
end;
/

create package body PKG_DEFINER
as
   procedure do_something as
   begin

      dbms_output.put_line('pkg_definer');

      execute immediate q'{
          begin
             dbms_output.put_line('  exec immediate: current schema before setting current_schema: ' || sys_context('userenv', 'current_schema'));
             execute immediate 'alter session set current_schema = pkg_user';
             dbms_output.put_line('  exec immediate: current schema after  setting current_schema: ' || sys_context('userenv', 'current_schema'));
          end;
      }';

   --
   -- Turns out, the alter session set current_schema in the
   -- previous execute immediate affects only the statement being
   -- executed in the execute statement. It does not change
   -- the enclosing scope.
   --
      dbms_output.put_line('  current schema after execute immediate:                       ' || sys_context('userenv', 'current_schema'));

   end do_something;
end pkg_definer;
/

create package body PKG_CURRENT_USER
as
   procedure do_something as
   begin

      
      dbms_output.put_line('pkg_current_user');

      execute immediate q'{
          begin
             dbms_output.put_line('  exec immediate: current schema before setting current_schema: ' || sys_context('userenv', 'current_schema'));
             execute immediate 'alter session set current_schema = pkg_owner';
             dbms_output.put_line('  exec immediate: current schema after  setting current_schema: ' || sys_context('userenv', 'current_schema'));
          end;
      }';

   --
   -- Turns out, the alter session set current_schema in the
   -- previous execute immediate affects affects also the scope
   -- of the enclosing  scope
   --
      dbms_output.put_line('  current schema after execute immediate:                       ' || sys_context('userenv', 'current_schema'));

   end do_something;
end pkg_current_user;
/



grant execute on pkg_definer      to pkg_user;
grant execute on pkg_current_user to pkg_user;
