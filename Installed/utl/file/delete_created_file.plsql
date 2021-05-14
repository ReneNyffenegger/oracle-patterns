begin

   utl_file.fremove('TMP_DIR', 'utl_file.test'); 

-- Directory not needed anymore:
   execute immediate 'drop directory TMP_DIR';

end;
/
