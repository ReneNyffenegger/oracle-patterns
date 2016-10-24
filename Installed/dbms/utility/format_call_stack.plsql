create or replace procedure print_stack_trace is -- {

  call_stack_   varchar2(4000);
  current_line_ varchar2(100);

  function next_line(cs in out varchar2) return varchar2 is  -- {
      next_line_ varchar2(100); 
  begin
      cs := substr(cs, instr(call_stack_, chr(10))+1);

      next_line_ := substr(cs, 1, instr(cs, chr(10))-1 );

      return next_line_;
  end next_line; -- }

begin

  call_stack_ := dbms_utility.format_call_stack;

  --   Get line for line:
  loop current_line_ := next_line(call_stack_); -- {

    dbms_output.put_line(current_line_);

    exit when current_line_ is null;
  end loop; -- }

--  Call stack looks something like:
--
--   object      line  object
--   handle    number  name
-- 0x4aeb783460        18  procedure RENE.PRINT_STACK_TRACE
-- 0x4aeb1e67a8         4  package body RENE.TQ84_CALL_STACK
-- 0x4aeb1e67a8         8  package body RENE.TQ84_CALL_STACK
-- 0x4aeb1e67a8        12  package body RENE.TQ84_CALL_STACK
-- 0x4aeb1e67a8        16  package body RENE.TQ84_CALL_STACK
-- 0x4af5035760         2  anonymous block


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
