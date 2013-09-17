-- where is an error caught that originates from with
-- a declare block?


declare  -- Outer Block {

   o  varchar2(10) := 'outer';

begin

   declare  -- Inner Block {

      i  varchar2(1) := 'inner'; -- Oh oh...

   begin

      dbms_output.put_line('not reached');

   exception when others then

   -- The exception is NOT caught here!
     
      dbms_output.put_line('Inner exception: ' || sqlerrm);

   end; -- }

exception when others then
  
   dbms_output.put_line('Outer exception: ' || sqlerrm);

end; -- }
/
