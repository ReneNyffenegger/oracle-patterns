create or replace package body renes_sql_translator as

   procedure translate_sql(
      sql_text             in   clob, 
      translated_text      out  clob
   )
   is begin
       translated_text := 'select * from (' || sql_text || ') where rownum < 2';
   end translate_sql;

 
   procedure translate_error(
      error_code           in   binary_integer,
      translated_code      out  binary_integer,
      translated_sqlstate  out  varchar2
   )
   is begin

      translated_code     := 42;
      translated_sqlstate :='what?';

   end translate_error;

end renes_sql_translator;
/
