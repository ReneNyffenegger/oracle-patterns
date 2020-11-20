create or replace package utl_call_stack_test as

    procedure run;
    procedure showStack(i_am varchar2);

end utl_call_stack_test;
/


create or replace package body utl_call_stack_test as

    procedure showStack(i_am varchar2) is
    begin
        dbms_output.new_line;
        dbms_output.put_line('Current stack for  ' || i_am);
        dbms_output.put_line('  dynamic depth:   ' || utl_call_stack.dynamic_depth);
        dbms_output.put_line('  error depth:     ' || utl_call_stack.error_depth);
        dbms_output.put_line('  backtrace depth: ' || utl_call_stack.backtrace_depth);
        dbms_output.new_line;

        for depth in /*reverse*/ 1 .. utl_call_stack.dynamic_depth loop
            dbms_output.put_line(
               to_char(UTL_CALL_STACK.lexical_depth(depth),    '90') || ' ' ||
               rpad   (UTL_CALL_STACK.unit_type    (depth),     30 ) || ' ' ||
               rpad   (UTL_CALL_STACK.subprogram   (depth)(1) , 30 ) || ' ' ||
               to_char(UTL_CALL_STACK.unit_line    (depth), '99990') || ' ' ||
                       UTL_CALL_STACK.concatenate_subprogram(
                       UTL_CALL_STACK.subprogram   (depth)
                       )
            );
        end loop;

        if utl_call_stack.error_depth > 0 then
           dbms_output.new_line;
        end if;

        for error in 1 ..  utl_call_stack.error_depth loop

            dbms_output.put_line('   ' ||
               rpad   (utl_call_stack.error_msg   (error), 100)    || ' ' ||
               to_char(utl_call_stack.error_number(error), '99990')
            );

        end loop;

        if utl_call_stack.backtrace_depth > 0 then
           dbms_output.new_line;
        end if;

        for backtrace in 1 ..  utl_call_stack.backtrace_depth loop

            dbms_output.put_line('   ' ||
               rpad   (utl_call_stack.backtrace_unit(backtrace), 61) || ' ' ||
               to_char(utl_call_stack.backtrace_line(backtrace), '99990')
            );

        end loop;

    end showStack;

    procedure PROC is
        procedure NESTED_PROC is
            i integer;
        begin
            showStack('NESTED_PPROC');

            i := 42/0;

        exception when others then
            showStack('Exception PROC');
            raise;
        end NESTED_PROC;
    begin
        showStack('PROC');
        NESTED_PROC;
    end PROC;

    procedure run is begin
        showStack('run');
        PROC;
    exception when others then
        showStack('exception run');
    end run;

end utl_call_stack_test;
/

show errors

exec utl_call_stack_test.showStack('SQL*Plus');
exec utl_call_stack_test.run
