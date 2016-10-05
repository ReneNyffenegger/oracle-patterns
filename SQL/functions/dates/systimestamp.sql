declare
  t0 timestamp;
  t1 timestamp;

  diff_interval interval day(0) to second(6);
  diff_seconds  number;
begin

  t0 := systimestamp;
  t1 := systimestamp;

  diff_interval := t1 - t0;
  diff_seconds  := extract(second from diff_interval);


  dbms_output.put_line('Diff: ' || diff_seconds || ' seconds.');

end;
/
