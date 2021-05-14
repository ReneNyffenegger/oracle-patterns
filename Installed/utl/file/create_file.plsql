declare
   temp_dir varchar2(266);
begin
   dbms_system.get_env('TEMP', temp_dir);
   execute immediate 'create directory TMP_DIR as ''' || temp_dir || '''';
end;
/

declare
  f   utl_file.file_type;
begin

  f := utl_file.fopen('TMP_DIR', 'utl_file.test', 'W');

  utl_file.put_line(f, 'First line');
  utl_file.put_line(f, 'Second line');
  utl_file.put_line(f, 'Third line');

  utl_file.fclose(f);

end;
/

-- drop directory TMP_DIR;

-- $type %temp%\utl_file.test
