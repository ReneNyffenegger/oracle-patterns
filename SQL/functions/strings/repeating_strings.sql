declare
  result varchar2(100);
  str    varchar2( 10);
  n      number;
begin

  str    :='foo';
  n      :=   4;  -- repeat 4 times

  result := rpad(str, n*length(str), str);

  dbms_output.put_line('result: ' || result);
end;
/
