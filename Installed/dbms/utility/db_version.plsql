declare
   version       varchar2(100);
   compatibility varchar2(100);
begin
  dbms_utility.db_version(version, compatibility);

  dbms_output.put_line('DB Version:   ' || version      );
  dbms_output.put_line('Compatibiliy: ' || compatibility);

end;
/
