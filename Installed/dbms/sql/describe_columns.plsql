declare

  sql_stmt   varchar2(32000) := 'select ''foo'' "Foo", 42 bar from dual';

  c          number;
  cntCols    number;
  cols       dbms_sql.desc_tab;

begin
  dbms_output.new_line;

  c := dbms_sql.open_cursor;

  dbms_sql.parse(c, sql_stmt, dbms_sql.native);
  dbms_sql.describe_columns (c, cntCols, cols);


  for i in 1 .. cntCols loop

      dbms_output.put_line('  ' || cols(i).col_name);

  end loop;

  dbms_sql.close_cursor(c);

  dbms_output.new_line;

end;
/
