declare

   d number;

   procedure raise_error (b in boolean) is -- {
   begin

       raise_application_error(-20801, 'Some text', b);

   end raise_error; -- }

   function divide_by_zero(b in boolean) return number is -- {
   begin
       return 5/0;
   exception when others then
       raise_error(b);
   end divide_by_zero; -- }

begin

   begin
      d := divide_by_zero(false);
   exception when others then
      dbms_output.put_line(sqlerrm);
   end;

   dbms_output.put_line('----------------------');

   begin
      d := divide_by_zero(true);
   exception when others then
      dbms_output.put_line(sqlerrm);
   end;
end;
/
