declare
   sql_new clob;
begin
   dbms_sql_translator.translate_sql(
      'select * from dba_users',
       sql_new
   );

   dbms_output.put_line('Translated SQL is:');
   dbms_output.put_line('  ' || sql_new);
end;
/
