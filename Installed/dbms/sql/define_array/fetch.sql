declare
   array_size integer := 4;

   cur        number;

   num    dbms_sql.number_table;
   txt    dbms_sql.varchar2_table;
   dat    dbms_sql.date_table;

   dummy      integer;
   rows       integer;

   a integer := 0;

begin

   cur := dbms_sql.open_cursor;

   dbms_sql.parse(cur, q'{
      select
         num,
         txt,
         dat
      from
         tq84_dbms_sql_array_test
      where
         txt  like :txt
      }',
      dbms_sql.native
   );

   dbms_sql.bind_variable(cur, ':txt', '%E%');

   dbms_sql.define_array(cur, 1, num, array_size, 1);
   dbms_sql.define_array(cur, 2, txt, array_size, 1);
   dbms_sql.define_array(cur, 3, dat, array_size, 1);
--
-- The return value of dbms_sql.execute is undefined for
-- select statements. Therefor, we assign it to a variable
-- named dummy:
--
   dummy := dbms_sql.execute(cur);

   loop

         rows := dbms_sql.fetch_rows(cur);

         dbms_output.put_line('-- rows = ' || rows || ', num.count = ' || num.count);

      --
      -- The call to dbms_sql.column_value appends the fetched
      -- values. Therefore, we need to delete the
      -- entries in the collections:
      --
         num.delete;
         txt.delete;
         dat.delete;

         dbms_sql.column_value(cur, 1, num );
         dbms_sql.column_value(cur, 2, txt );
         dbms_sql.column_value(cur, 3, dat );

         for i in 1 .. rows loop

             dbms_output.put_line(
                 to_char(num(a+i), '99') || ' ' ||
                 rpad(   txt(a+i),   10) || ' ' ||
                 to_char(dat(a+1), 'yyyy-mm-dd hh24:mi;ss')
             );

         end loop;

         exit when rows != array_size;



         a := a+rows;

   end loop;

   dbms_sql.close_cursor (cur);

end;
/
