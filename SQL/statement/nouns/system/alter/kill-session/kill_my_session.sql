create or replace procedure sys.kill_my_session (
   sid_   in number,
   serial in number
) as

--
-- Found at
-- http://dba-blogs.blogspot.com/2013/09/kill-my-session.html
-- slightly adapted by me
--

   this_ses_user       varchar2(32);
   other_ses_user      varchar2(32);
   this_machine        varchar2(32);
   other_machine       varchar2(32);
   instance            number;

begin

   this_ses_user     := sys_context('userenv', 'session_user');
   this_machine      := sys_context('userenv', 'host'        );

   begin

      select
         username,
         inst_id,
         machine
      into
         other_ses_user,
         instance,
         other_machine
      from
         gv$session
      where
         sid=sid_        and
         serial#= serial;

      exception when no_data_found then
          dbms_output.put_line('no session found for ' || sid_ || ',' || serial);
          return;
      end;


      if this_ses_user = other_ses_user and this_machine = other_machine then

         declare
            stmt varchar2(200);
         begin
            stmt := 'alter system kill session ''' || sid_ || ',' || serial || ',@' || instance || '''';

            execute immediate stmt;
            dbms_output.put_line('successful: ' || stmt);

         exception when others then
            dbms_output.put_line(stmt || ' threw ' || sqlerrm);
         end;

    else
      dbms_output.put_line(q'[cannot kill another user's session]');
   end if;

end;
/

show err

grant execute on kill_my_session to public;
