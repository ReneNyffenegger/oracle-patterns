begin
   dbms_output.put_line(to_char(sysdate, 'hh24:mi:ss') || ': going to sleep for 3 seconds.');
   dbms_lock.sleep(3);

   dbms_output.put_line(to_char(sysdate, 'hh24:mi:ss') || ': going to sleep for 5 seconds.');
   dbms_lock.sleep(5);

   dbms_output.put_line(to_char(sysdate, 'hh24:mi:ss') || ': finished.');
end;
/
