begin

  dbms_output.put_line('Version: ' || dbms_db_version.version);
  dbms_output.put_line('Release: ' || dbms_db_version.release);

end;
/
