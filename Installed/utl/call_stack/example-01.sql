create or replace package tq84_call_stack_test as

    procedure a;


end tq84_call_stack_test;
/

create or replace package body tq84_call_stack_test as

    procedure d is begin
      raise_application_error(-20801, 'error raised in d');
    end d;

    procedure c is begin d; end c;
    procedure b is begin c; end b;

    procedure a is begin
      b;
    exception when others then
      dbms_output.put_line('exception caught in a, backtrace_depth:  ' || utl_call_stack.backtrace_depth);

      for i in 1 .. utl_call_stack.backtrace_depth loop
          dbms_output.put_line('  ' || i || ' @ ' || utl_call_stack.backtrace_line(i));
      end loop;
    end a;

end tq84_call_stack_test;
/
show errors

exec tq84_call_stack_test.a

drop package tq84_call_stack_test;
