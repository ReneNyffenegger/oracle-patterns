declare
  n number;
begin

  execute immediate 'declare l number; begin l := 42; :1 := l; end;' using out n;

  dbms_output.put_line('n: ' || n);

end;
/
