create or replace package body tq84_thrower as

    another_exc exception;
--  c_another_exc number := 20123;
    pragma exception_init(another_exc, -20123);


    procedure might_throw(do boolean) is -- {
    begin

        if do then
           raise exc;
        end if;

    end might_throw; -- }


    procedure might_throw_another(do boolean) is -- {
    begin

        if do then
           raise_application_error(-20123, 'An exception was thrown, because do was true');
        end if;

    end might_throw_another; -- }


end tq84_thrower;
/
