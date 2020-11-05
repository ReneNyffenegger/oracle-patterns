--drop function tabN;

create or replace function tabN(n integer) return varchar2 sql_macro
is begin
   dbms_output.put_line('tabN being called, n = ' || n);
   return 'select * from T' || mod(n, 2);
end tabN;
/

