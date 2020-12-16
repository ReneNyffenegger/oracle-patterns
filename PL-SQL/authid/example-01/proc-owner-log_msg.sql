create procedure log_msg(msg varchar2) as begin
   dbms_output.put_line('PROC_OWNER: ' || msg);
end log_msg;
/
