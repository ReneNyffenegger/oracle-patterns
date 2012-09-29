create directory TMP_DIR as 'C:\temp';

declare

  f   utl_file.file_type;

begin

  f := utl_file.fopen('TMP_DIR', 'utl_file.test', 'W');

  utl_file.put_line(f, 'First line');
  utl_file.put_line(f, 'Second line');

  utl_file.fclose(f);

end;
/

drop directory TMP_DIR;

$type c:\temp\utl_file.test
