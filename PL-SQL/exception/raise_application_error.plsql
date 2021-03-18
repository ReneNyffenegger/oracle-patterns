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

   procedure print_error_stack is -- {
   begin
       dbms_output.put_line('error depth: ' || utl_call_stack.error_depth);
       dbms_output.put_line('  sqlerrm: ' || sqlerrm);
       dbms_output.put_line('');
       for d in 1 .. utl_call_stack.error_depth loop
           dbms_output.put_line('  ' || utl_call_stack.error_number(d) || ': ' || utl_call_stack.error_msg(d));
       end loop;

   end print_error_stack; -- }

begin

   begin
      d := divide_by_zero(false);
   exception when others then
      print_error_stack;
   end;

   dbms_output.put_line('----------------------');

   begin
      d := divide_by_zero(true);
   exception when others then
      print_error_stack;
   end;
end;
/
