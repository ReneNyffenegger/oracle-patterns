create or replace procedure tq84_log(t varchar2) as
   pragma autonomous_transaction;
begin
   insert into tq84_log_table(txt) values (t);
   commit;
end tq84_log;
/
