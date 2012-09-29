create directory TMP_DIR as 'c:\temp';

declare


begin

  utl_file.fremove('TMP_DIR', 'utl_file.test'); 

end;
/

drop directory TMP_DIR;
