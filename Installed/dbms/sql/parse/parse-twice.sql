declare

   cur number;

   procedure print_column_names(c number) is
      cntCols    number;
      cols       dbms_sql.desc_tab;
   begin

      dbms_sql.describe_columns (c, cntCols, cols);

      dbms_output.new_line;
      for i in 1 .. cntCols loop
          dbms_output.put_line('  ' || cols(i).col_name);
      end loop;

   end print_column_names;

begin


   cur := dbms_sql.open_cursor;

   dbms_sql.parse(cur, 'select * from user_tables', dbms_sql.native);
   print_column_names(cur);

--
-- Use same cursor again:
--
   dbms_sql.parse(cur, 'select * from dual', dbms_sql.native);
   print_column_names(cur);

   dbms_sql.close_cursor(cur);

   dbms_output.new_line;

end;
/
