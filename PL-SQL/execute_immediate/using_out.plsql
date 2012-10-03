declare

  n number;

begin

  execute immediate 'begin :1 := 42; end;' using out n;

  dbms_output.put_line('n: ' || n);

end;
/
