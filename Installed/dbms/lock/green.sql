prompt
prompt The "green" session
prompt ===================
prompt

prompt the Blue session has allocated a lock
prompt press enter to try to allocate the same lock
accept x prompt "in the green session as well."
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

exit;
