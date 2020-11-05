create or replace function randomTable return varchar2 sql_macro
is begin
   return 'select * from T' || mod(trunc(extract(second from systimestamp)), 2);
end randomTable;
/
