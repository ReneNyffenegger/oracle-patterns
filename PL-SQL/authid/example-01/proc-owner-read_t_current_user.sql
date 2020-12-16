create procedure read_t_current_user
   AUTHID CURRENT_USER
as begin
   for rec in (select txt from t) loop
       log_msg(rec.txt);
   end loop;
end;
/
