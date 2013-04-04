declare

   procedure test_17nn(p_text in varchar2) is
   --
   -- Tests if p_text is 17 followed by 2 digits.
   --

   begin

       if regexp_like(p_text, '$17\d\d') then
          dbms_output.put_line(p_text || ' is ok');
       else
          dbms_output.put_line(p_text || ' is not ok');
       end if;

   end test_17nn;

begin


  test_17nn('1764');
  test_17nn('x1764');
  test_17nn('1764x');
  test_17nn('17a5');


end;
/
