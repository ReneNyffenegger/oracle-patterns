prompt
prompt press enter to stop the blue sessions
accept x prompt " "

declare

   lock_handle_stop      varchar2(100);
   lock_handle_running   varchar2(100);

   success number;
   dummy   number;


begin
   dbms_lock.allocate_unique('running'       , lock_handle_running);
   dbms_lock.allocate_unique('stop-iteration', lock_handle_stop   );


   -- We try to request an exclusive lock.
   -- As soon as we got it, we know that the other jobs are not
   -- in the "critical part"
   --
   -- We try 60 seconds only
   success := dbms_lock.request(lock_handle_stop, dbms_lock.x_mode, 60);

   if success = 1 then
      dbms_output.put_line('Timeout, could not stop other jobs');
   else

      success := dbms_lock.request(lock_handle_stop, dbms_lock.x_mode, 60);

   -- Now that we have exclusively gotten the running lock (which means that
   -- the "critical part" can only be left, but not entered anymore, we
   -- also want the running lock exclusively which we get as soon as all
   --"blue" jobs have indicated they're leaving the processing.
      success := dbms_lock.request(lock_handle_running, dbms_lock.x_mode, 60);

      dbms_output.put_line('Other jobs should now be terminated, success: ' || success);
   end if;

   dummy   := dbms_lock.release(lock_handle_stop);
end;
/

exit
