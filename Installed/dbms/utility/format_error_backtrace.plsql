--
--  Compare with format_error_stack.plsql
--

create or replace package tq84_backtrace as -- {

    procedure p;

end tq84_backtrace; 
/
-- }

create or replace package body tq84_backtrace as -- {

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

end tq84_backtrace; 
/
-- }

begin
  tq84_backtrace.p;
exception when others then
  dbms_output.put_line(dbms_utility.format_error_backtrace);
end;
/


drop package tq84_backtrace;
