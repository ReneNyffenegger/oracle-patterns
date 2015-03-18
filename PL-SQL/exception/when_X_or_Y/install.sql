create or replace package tq84_foo as

    exc_one   exception;
    exc_two   exception;
    
    pragma exception_init(exc_one, -20731);
    pragma exception_init(exc_two, -20732);

    procedure throw_up(x in number);

end tq84_foo;
/

create or replace package body tq84_foo as

    procedure throw_up(x in number) is
    begin

        if x = 1 then
           raise_application_error(-20731, 'Exception one!');
        end if;

        if x = 2 then
           raise_application_error(-20732, 'Exception two!');
        end if;

        raise_application_error(-20800, 'Other error');

    end throw_up;

end tq84_foo;
/

create or replace package tq84_bar as

    procedure proc(x in number);

end tq84_bar;
/

create or replace package body tq84_bar as

    procedure proc(x in number) is
    begin

        tq84_foo.throw_up(x);

    exception

        when tq84_foo.exc_one or tq84_foo.exc_two then

             dbms_output.put_line('tq84_bar caught ' || sqlerrm);

             if sqlcode = -20731 then
                raise;
             end if;

        when others then
        
             raise;

    end proc;

end tq84_bar;
/
