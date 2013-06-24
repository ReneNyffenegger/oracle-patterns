create or replace trigger tq84_ddl_trigger
instead of create on schema
begin

-- execute immediate 'create table tq84_trigger_has_fired as select sysdate creation_date from dual';

   dbms_output.put_line('Create @ ' || sysdate);

   for r in (

     select s.sid,
            q.address,
            q.sql_text --into sqltext_ 
       from sys.v_$session s join 
            sys.v_$sqltext     q on s.sql_address = q.address --and s.sql_hash_value = q.hash_value
      where -- s.sid=sys_context('USERENV', 'SID')
            upper(q.sql_text) like '%STRAWBERRY%'

   ) loop

     dbms_output.put_line(r.sid);
     dbms_output.put_line(r.address);
     dbms_output.put_line(r.sql_text);

     dbms_output.put_line('');
     dbms_output.put_line('---');
     dbms_output.put_line('');


   end loop;

end tq84_ddl_trigger;
/

show errors

prompt
prompt


--  Not found in v$sql:
--    create package tq84_pck as
--    end tq84_pck;
--    /

create table tq84_strawberry (a number, b varchar2(10));

prompt
prompt


drop trigger tq84_ddl_trigger;
