create or replace procedure print_stack_trace is -- {

  call_stack_   varchar2(4000);
  current_line_ varchar2(100);

  function next_line(cs in out varchar2) return varchar2 is 
      next_line_ varchar2(100); 
  begin
      cs := substr(cs, instr(call_stack_, chr(10))+1);

      next_line_ := substr(cs, 1, instr(cs, chr(10))-1 );

      return next_line_;
  end next_line;

begin

  call_stack_ := dbms_utility.format_call_stack;

  -------------------------------------------------------------------------------------
  -- Jump over the header that looks something like so (constisting of two lines):
  --
  --    ----- PL/SQL Call Stack -----
  --      object      line  object
  --      handle    number  name

  call_stack_ := substr(call_stack_, instr(call_stack_, chr(10))+1);
  call_stack_ := substr(call_stack_, instr(call_stack_, chr(10))+1);

  -------------------------------------------------------------------------------------

  --   Get line for line:
  loop current_line_ := next_line(call_stack_);

    dbms_output.put_line(current_line_);

    exit when current_line_ is null;
  end loop;


end print_stack_trace;
/
-- }

create or replace package tq84_call_stack as -- {

    procedure p;

end tq84_call_stack; 
/
-- }

create or replace package body tq84_call_stack as -- {

    procedure p3 is begin
        print_stack_trace;
    end p3;

    procedure p2 is begin
        p3;
    end p2;

    procedure p1 is begin
        p2;
    end p1;

    procedure p is begin
        p1;
    end p;

end tq84_call_stack; 
/
-- }

begin
  tq84_call_stack.p;
exception when others then
  dbms_output.put_line('Error: ' || dbms_utility.format_error_stack);
end;
/


drop package tq84_call_stack;
drop procedure print_stack_trace;
