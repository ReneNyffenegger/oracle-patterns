declare

  n number := 21;

begin

  execute immediate 'begin :1 := :1 * 2; end;' using in out n;

  dbms_output.put_line('n: ' || n);

end;
/
