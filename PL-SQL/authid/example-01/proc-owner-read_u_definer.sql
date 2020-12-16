create procedure read_u_definer
   AUTHID DEFINER
as begin
   for rec in (select txt from u) loop
       log_msg(rec.txt);
   end loop;
end;
/
