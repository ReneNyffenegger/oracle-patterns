declare

   lock_handle_stop    varchar2(100);
   lock_handle_running varchar2(100);

   success number;
   dummy   number;


begin
   -- We indicate that we're running
   dbms_lock.allocate_unique('running', lock_handle_running);
   success := dbms_lock.request(lock_handle_running, dbms_lock.s_mode, 0);



   dbms_lock.allocate_unique('stop-iteration', lock_handle_stop);

   loop

   --  We try to allocate a shared lock on lock_handle_stop.
   --
   --
   --  If another session already holds the lock exclusively,
   --  request will return 1 (that is: timeout).
   --
   --  We wait 0 seconds, so that we immediatly can
   --  exit the loop.


       success := dbms_lock.request(lock_handle_stop, dbms_lock.s_mode, 0.1);

       --  We also release the lock immediatly, so that we give
       --  another session the chance to lock it exclusively:
       dummy   := dbms_lock.release(lock_handle_stop);


       if success = 1 then -- timeout has occured
          exit;
       end if;

   --  Wait for 5 to 10 seconds
   --
   --  This would be the "critical part".
       dbms_lock.sleep(dbms_random.value(5,10));

   end loop;

   --         We're not really running anymore, so
   --         we release the according lock, so that
   --         the "green session" can enslock on this ure we're
   --         not running anymore by successfully
   --         requesting an exclusive lock
   dummy   := dbms_lock.release(lock_handle_running);

end;
/

exit
