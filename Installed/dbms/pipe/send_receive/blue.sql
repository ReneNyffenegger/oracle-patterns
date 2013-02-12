declare

   v number;

begin

-- Wait 3 seconds...
   dbms_lock.sleep(3);

-- ... then write a message into a pipe

   dbms_pipe.pack_message('Hello from the blue session!');

   v := dbms_pipe.send_message('tq84-send-receive-pipe');

   dbms_output.put_line('Message sent [' || v || ']');

end;
/

exit
