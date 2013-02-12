prompt going to write two messages

declare -- {

   procedure send_msg(m in varchar2) is -- {
      v number;
   begin

        dbms_pipe.pack_message(m);
        v := dbms_pipe.send_message('tq84-purge-pipe');

   end send_msg; -- }

begin

-- Write two messages into a pipe

   send_msg('First message');
   send_msg('Second  message');

end; -- }
/

prompt sleeping six seconds, before writing another message
exec dbms_lock.sleep (6)

declare -- {

   procedure send_msg(m in varchar2) is -- {
      v number;
   begin

        dbms_pipe.pack_message(m);
        v := dbms_pipe.send_message('tq84-purge-pipe');

   end send_msg; -- }

begin

-- Write two messages into a pipe

   send_msg('Third message');

end; -- }
/

exit
