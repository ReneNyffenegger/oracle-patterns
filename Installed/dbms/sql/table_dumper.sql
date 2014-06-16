set tab off
set verify off
@spool c:\temp\table_out.txt
declare
--
--     Create a tabular, textual output from an SQL resultset.
--
--
--stmt_txt varchar2(4000) := '&1';

  stmt_txt varchar2(4000) := 'select * from (select * from dba_users)';

  with_underlined_header   boolean := true;
  with_quoted_column_names boolean := true;

  -- Type definitions, record, table etc {

  type record_t is table of varchar2(4000);
  type table_t  is table of record_t;

  data_ table_t := table_t();

  --

  type column_t  is record(name varchar2(30), max_length number, datatype char(1) /* N, D, C */);
  type columns_t is table of column_t;
  column_  column_t;
  columns_  columns_t := columns_t();

  -- }

  column_count integer;

  colum_value  varchar2(4000);

  -- dbms_sql {

  cursor_      integer;
  res_         integer;

  table_desc_  dbms_sql.desc_tab;

  -- }

  procedure column_names_and_types is -- {
  begin

      for c in 1 .. column_count loop -- {

--        create_table_stmt := create_table_stmt || ',' || descTab(c).col_name || ' ';

          column_.name         :=  table_desc_(c).col_name;

          column_.max_length   :=  length(column_.name);
--        if with_quoted_column_names then
--           column_.max_length := column_.max_length + 2;
--        end if;

          column_.datatype     :=  case table_desc_(c).col_type 
                                   when dbms_sql.number_type   then 'N'
                                   when dbms_sql.date_type     then 'D'
                                   when dbms_sql.varchar2_type then 'C'
                                   else '??' -- does not fit into char(1), aborts script!
                                   end;

          if column_.datatype = 'C' or column_.datatype = 'D' then
          --
          -- Make room for the two apostrophes in the «resultset»
          --
             column_.max_length := column_.max_length + 2;
          end if;

          columns_.extend;
          columns_(c) := column_;

      end loop; -- }

  end column_names_and_types; -- }

  procedure result_set is -- {
  begin

      loop -- {

          exit when dbms_sql.fetch_rows(cursor_) = 0;

          data_.extend;
          data_(data_.count) := record_t();

          for c in 1 .. column_count loop

              dbms_sql.column_value(cursor_, c, colum_value);

              data_(data_.count).extend;
              data_(data_.count)(c) := colum_value;

              if columns_(c).max_length  < length(colum_value) then
                 columns_(c).max_length := length(colum_value);
              end if;

          end loop;


      end loop; -- }

  end result_set; -- }

  procedure header(underline in boolean) is begin -- {

      for c in 1 .. column_count loop -- {

          if columns_(c).datatype = 'C' or columns_(c).datatype = 'D' then
             dbms_output.put(' ');
          end if;

          if not underline then 
             if with_quoted_column_names then
                dbms_output.put('''');
             end if;
             dbms_output.put(columns_(c).name);
             if with_quoted_column_names then
                dbms_output.put('''');
             end if;
             dbms_output.put(rpad(' ', columns_(c).max_length-length(columns_(c).name)));
          else
             if with_quoted_column_names then
                dbms_output.put(' ');
             end if;
             dbms_output.put(rpad('-', columns_(c).max_length, '-'));
             if with_quoted_column_names then
                dbms_output.put(' ');
             end if;
          end if;

          if columns_(c).datatype = 'C' or columns_(c).datatype = 'D' then
             dbms_output.put(' ');
          end if;

          dbms_output.put('  ');

      end loop; -- }

      dbms_output.new_line;
  end header; -- }

begin


  cursor_  := dbms_sql.open_cursor;
  dbms_sql.parse(cursor_, stmt_txt, dbms_sql.native);

  dbms_sql.describe_columns(/*in*/ cursor_, /*out*/ column_count, /*out*/ table_desc_);


  for c in 1 .. column_count loop -- {

      dbms_sql.define_column(cursor_, c, colum_value, 4000);

  end loop; -- }

  res_ := dbms_sql.execute(cursor_);

  column_names_and_types;

  result_set;


  dbms_sql.close_cursor(cursor_);

  header(false);

  if with_underlined_header then
     header(true);
  end if;


  for r in 1 .. data_.count loop -- {

      for c in 1 .. column_count loop -- {

          if with_quoted_column_names then
             dbms_output.put(' ');
          end if;

          if columns_(c).datatype = 'C' or columns_(c).datatype = 'D' then
             dbms_output.put('''');
          end if;

          -- Outputting the value {

          if data_(r)(c) is not null then

             dbms_output.put(data_(r)(c));

          else


             if columns_(c).datatype = 'N' then
             -- Numerical columns require null values to be explicitely written:
                dbms_output.put('null');
             end if;


          end if;

          -- }

          if columns_(c).datatype = 'C' or columns_(c).datatype = 'D' then
             dbms_output.put('''');
          end if;

          -- Padding:
          dbms_output.put(lpad(' ', columns_(c).max_length - nvl(length(data_(r)(c)), 
                                                                 case when columns_(c).datatype = 'N' then 4  -- Numerical nulls are explicitely written...
                                                                      else 0 end                              -- Char nulls are not.
                                                                 ), ' '));

          if c < column_count then
          -- Print commas "," between the values but don't
          -- print the final comma:
             dbms_output.put(', ');
          end if;
             
          if with_quoted_column_names then
             dbms_output.put(' ');
          end if;

      end loop; -- }

      dbms_output.new_line;

  end loop; -- }
  
end;
/
@spool_off

