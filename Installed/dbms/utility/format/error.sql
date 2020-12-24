create or replace procedure print_stacks(id varchar2) is begin
   dbms_output.put_line('Exception in ' || id);
   dbms_output.put_line('format_error_stack');
   dbms_output.put_line(dbms_utility.format_error_stack);
   dbms_output.put_line('format_error_backtrace');
   dbms_output.put_line(dbms_utility.format_error_backtrace);
end;
/


create package tq84_pkg_1 as

    procedure entry;
    procedure p2;

end tq84_pkg_1; 
/

create package tq84_pkg_2 as

    procedure p1;
    procedure cause_error;

end tq84_pkg_2; 
/

create package body tq84_pkg_1 as

    procedure p2 is begin
        tq84_pkg_2.cause_error;
    end p2;

    procedure entry is begin
        tq84_pkg_2.p1;
    exception when others then
        print_stacks('tq84_pkg_1.entry');
        raise;
    end entry;

end tq84_pkg_1; 
/

create package body tq84_pkg_2 as

    procedure cause_error is begin
        execute immediate 'error';
    end cause_error;

    procedure p1 is begin
        tq84_pkg_1.p2;
    exception when others then
        print_stacks('tq84_pkg_2.p1');
        raise;
    end p1;

end tq84_pkg_2; 
/

begin
   tq84_pkg_1.entry;
exception when others then
   print_stacks('anonymous_block');
end;
/


drop package tq84_pkg_1;
drop package tq84_pkg_2;
drop procedure print_stacks;

exit
