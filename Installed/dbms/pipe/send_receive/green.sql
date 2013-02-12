declare

   v number;

   m varchar2(4096);
 
begin

-- Waiting for the message sent in the green session:
   
   v := dbms_pipe.receive_message('tq84-send-receive-pipe');

   dbms_pipe.unpack_message(m);

   dbms_output.put_line('Message received [' || v || ']');
   dbms_output.put_line('  ' || m);


end;
/

exit
