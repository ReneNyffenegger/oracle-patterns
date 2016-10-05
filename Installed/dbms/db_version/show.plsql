--
--  Compare with dbms_utility.db_version
--
begin

  dbms_output.put_line('Version: ' || dbms_db_version.version);
  dbms_output.put_line('Release: ' || dbms_db_version.release);

  -- The constants in this package are 'static', so they
  -- can be used in Conditional Compilation.

end;
/
