create table tq84_maxsize (
  col_1 varchar2(4000)
)
storage ( maxsize 1 M );

declare
  bytes_prev number := 0;
  bytes_curr number;
  i number := 1;


  procedure bytes_of_segment is -- {
  begin
    select bytes into bytes_curr
      from user_segments
     where segment_name = 'TQ84_MAXSIZE';

  end bytes_of_segment; -- }

  procedure report_i_and_bytes is -- {
  begin

         dbms_output.put_line(to_char(i              , '9999') || ': '   || 
                              to_char(bytes_prev/1024, '9999') || ' -> ' ||
                              to_char(bytes_curr/1024, '9999') || '  ' 
         );
  end report_i_and_bytes; -- }

begin

  while i < 1000*1000/4000 loop
      insert into tq84_maxsize values (lpad('x', 4000, 'x'));
      i := i+1;
      
      bytes_of_segment;

      if bytes_curr != bytes_prev then
         
         report_i_and_bytes;

         bytes_prev := bytes_curr;

      end if;
      
      
  end loop;

exception when others then
  dbms_output.put_line(sqlerrm);
  
  report_i_and_bytes;
end;
/

drop table tq84_maxsize;

--   Output:
--
--     2:     0 ->    64
--     7:    64 ->   128
--    15:   128 ->   192
--    22:   192 ->   256
--    30:   256 ->   320
--    37:   320 ->   384
--    45:   384 ->   448
--    52:   448 ->   512
--    60:   512 ->   576
--    67:   576 ->   640
--    75:   640 ->   704
--    82:   704 ->   768
--    90:   768 ->   832
--    97:   832 ->   896
--   105:   896 ->   960
--   112:   960 ->  1024
-- ORA-60004: adding (256) blocks to table ERGARCIA.TQ84_MAXSIZE with MAXSIZE (128)
--   119:  1024 ->  1024

