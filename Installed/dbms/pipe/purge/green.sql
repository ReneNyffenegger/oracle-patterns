prompt Sleeping three seconds, before reading message
exec dbms_lock.sleep(3)

declare

   procedure read_msg is

       v number;
       m varchar2(4096);

   begin

       v := dbms_pipe.receive_message('tq84-purge-pipe');

       dbms_pipe.unpack_message(m);

       dbms_output.put_line('Message received [' || v || ']');
       dbms_output.put_line('  ' || m);

   end read_msg;
 
begin

-- Waiting for the message sent in the green session:
-- This read should find the 'First message'
   read_msg;

-- Calling dbms_pipe.purge here should delete
-- the 'Second message':
   dbms_pipe.purge('tq84-purge-pipe');

-- Now, 'Third message' should be read as
-- soon as it is posted.
   read_msg;

end;
/

exit
