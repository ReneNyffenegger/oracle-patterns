declare
   c1   integer;
   c2   integer;
   c3   integer;
begin

   c1 := dbms_sql.open_cursor;
   c2 := dbms_sql.open_cursor;
   c3 := dbms_sql.open_cursor;

   dbms_sql.parse(c1, 'create user xyz identified by abc', dbms_sql.native);

-- Expected: 19 («create user»)
   dbms_output.put_line('last_sql_function_code = ' || dbms_sql.last_sql_function_code);

-- Expected: 4 («select»)
   dbms_sql.parse(c2, 'select * from dual', dbms_sql.native);
   dbms_output.put_line('last_sql_function_code = ' || dbms_sql.last_sql_function_code);

-- parse() also executes DDL statements, so we have to drop
-- the user again.
   dbms_sql.parse(c3, 'drop user xyz', dbms_sql.native);
-- Expected: 11 («drop user»)
   dbms_output.put_line('last_sql_function_code = ' || dbms_sql.last_sql_function_code);

   dbms_sql.close_cursor(c1);
   dbms_sql.close_cursor(c2);
   dbms_sql.close_cursor(c3);

end;
/
