begin

  dbms_output.put_line('for i in 5 .. 5');
  for i in 5 .. 5 loop
      dbms_output.put_line('i: ' || i);
  end loop;

end;
/
