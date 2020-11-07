create or replace function randomTable return varchar2 sql_macro
is
   compile_date varchar2(19) := to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss');
begin

   return '
      select
      ''' || compile_date || '''                     compile_date,
         to_char(sysdate, ''yyyy-mm-dd hh24:mi:ss'') exec_date,
         txt
      from
         T' || mod(trunc(extract(second from systimestamp)), 2);

end randomTable;
/
