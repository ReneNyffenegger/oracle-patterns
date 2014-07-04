create or replace package body tq84_thrower as

    --    Not associated with an error code via
    --    exception_init:
    exc_i exception;


    procedure raise_exc_1 is -- {
    begin
        raise exc_1;
    end raise_exc_1; -- }

    procedure raise_exc_2 is -- {
    begin
        raise exc_2;
    end raise_exc_2; -- }

    procedure raise_exc_3 is -- {
    begin
        raise exc_3;
    end raise_exc_3; -- }

    procedure raise_exc_i is -- {
    begin
        raise exc_i;
    end raise_exc_i; -- }

    procedure raise_app_error(error_code number) is -- {
    begin
        raise_application_error(-error_code, 'Request to raise error ' || error_code);
    end raise_app_error; -- }


end tq84_thrower;
/
