--
--  Compare with format_error_backtrace.plsql
--

create or replace package tq84_error_trace as -- {

    procedure p;

end tq84_error_trace; 
/
-- }

create or replace package body tq84_error_trace as -- {

    procedure p3 is begin
        execute immediate 'error';
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

end tq84_error_trace; 
/
-- }

begin
  tq84_error_trace.p;
exception when others then
  dbms_output.put_line('Error: ' || dbms_utility.format_error_stack);
end;
/


drop package tq84_error_trace;
