declare
  range varchar2(200);
begin
   range := utl_raw.xrange('6A', '82');
   dbms_output.put_line(range);
-- 6A6B6C6D6E6F707172737475767778797A7B7C7D7E7F808182

   dbms_output.put_line(regexp_replace(range, '(..)', '\1 - '));
-- 6A - 6B - 6C - 6D - 6E - 6F - 70 - 71 - 72 - 73 - 74 - 75 - 76 - 77 - 78 - 79 - 7A - 7B - 7C - 7D - 7E - 7F - 80 - 81 - 82 -
end;
/
