create directory TMP_DIR as 'c:\temp';

declare

   f     utl_file.file_type;

   line  varchar2(100);

begin

  f := utl_file.fopen('TMP_DIR', 'utl_file.test', 'R');

  utl_file.get_line(f, line); dbms_output.put_line(line);
  utl_file.get_line(f, line); dbms_output.put_line(line);

  utl_file.fclose(f);

end;
/

drop directory TMP_DIR;
