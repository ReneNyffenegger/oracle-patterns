declare

   f     utl_file.file_type;

   line  varchar2(100);

begin

  f := utl_file.fopen('TMP_DIR', 'utl_file.test', 'R');

  begin loop

        utl_file.get_line(f, line); 
        dbms_output.put_line(line);

        end loop;

        exception when no_data_found then 
            null; -- Last line read read
  end;

  utl_file.fclose(f);

end;
/
