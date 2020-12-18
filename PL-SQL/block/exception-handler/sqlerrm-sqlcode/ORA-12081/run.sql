create procedure ORA_12081_PRC as
begin

   execute immediate q'{

      create table ora_12081_tab as
      select *
      from all_objects
      where
         last_ddl_time = to_date(sysdate, 'dd.mm.yyyy')

   }';

exception when others then

   dbms_output.put_line('sqlerrm:  ' || sqlerrm);

   for d in 1..utl_call_stack.error_depth loop
       dbms_output.put_line('errormsg: ' || utl_call_stack.error_msg(d));
   end loop;

end;
/

alter session set nls_date_format = 'yyyy-mm-dd';
alter session force parallel query parallel 4;
begin
   ORA_12081_PRC;
end;
/

drop procedure ORA_12081_PRC;
