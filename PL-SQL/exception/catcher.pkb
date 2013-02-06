create or replace package body tq84_catcher as

    procedure try(what varchar2, num number) is begin -- {


       if    what  = 'exc' then

             if num = 1 then tq84_thrower.raise_exc_1; elsif
                num = 2 then tq84_thrower.raise_exc_2; elsif
                num = 3 then tq84_thrower.raise_exc_3; elsif
                num = 0 then tq84_thrower.raise_exc_i; else
                             raise_application_error(-20801, 'Unknown num: ' || num);
             end if;

       elsif what  = 'raise' then

             tq84_thrower.raise_app_error(num);

       else

             raise_application_error(-20800, 'Unknown what: ' || what);

       end if;


    exception 
    
        when tq84_thrower.exc_1 then
             dbms_output.put_line('  Error exc_1 (' || what || '/' || num || ') ' || sqlerrm || '[' || sqlcode || ']');

--  Commented out to prevent
--   PLS-00484: redundant exceptions 'EXC_1' and 'EXC_2' must appear in same exception handler
-- 
--      when tq84_thrower.exc_2 then
--           dbms_output.put_line('  Error exc_2 (' || what || '/' || num || ') ' || sqlerrm || '[' || sqlcode || ']');

        when tq84_thrower.exc_3 then
             dbms_output.put_line('  Error exc_3 (' || what || '/' || num || ') ' || sqlerrm || '[' || sqlcode || ']');

        when others then
             dbms_output.put_line('  Error other (' || what || '/' || num || ') ' || sqlerrm || '[' || sqlcode || ']');

    end try; -- }

    procedure go is begin -- {


        try('exc'   ,     1);
        try('exc'   ,     2);
        try('exc'   ,     3);

        try('raise' , 20000);
        try('raise' , 20100);
        try('raise' , 20200);


    end go; -- }


end tq84_catcher;
/
