--
--  Compare with format_error_stack.plsql
--

create or replace package tq84_who_calls_me as -- {

    procedure p;

end tq84_who_calls_me; 
/
-- }

create or replace package body tq84_who_calls_me as -- {

    procedure p3 is 

      owner_    varchar2(30);
      name_     varchar2(30);
      lineno_   number;
      caller_t_ varchar2(30);
    
    begin

       owa_util.who_called_me(owner_, name_, lineno_, caller_t_);
       dbms_output.put_line(owner_ || '.' || name_ || ' [' || lineno_ || '] ' || caller_t_);
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

end tq84_who_calls_me; 
/
-- }

begin
  tq84_who_calls_me.p;
end;
/


drop package tq84_who_calls_me;
