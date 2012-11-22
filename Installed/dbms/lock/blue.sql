prompt
prompt The "blue" session
prompt ==================
prompt


variable lockhandle varchar2(100)

variable x_mode     number
exec :x_mode := dbms_lock.x_mode

exec dbms_lock.allocate_unique('tq84-lock', :lockhandle)
exec dbms_output.put_line ('lockhandle ' ||  :lockhandle || ' allocated');
select case dbms_lock.request(:lockhandle, :x_mode) 
       when 0 then 'Success'
       when 1 then 'Timeout'
       when 2 then 'Deadlock'
       when 3 then 'Parameter error'
       when 4 then 'Already own lock'
       when 5 then 'Illegal lock handle' end from dual;


prompt Go now to the green session and press enter
prompt then press enter here to commit the blue session
accept x prompt " "

commit;

prompt commit issued.
prompt The green session should still be blocked.
prompt Press enter here to terminate the blue
prompt session. This should unblock the green
prompt session.
accept x prompt " "


exit;
