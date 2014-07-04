create or replace package tq84_thrower as

    exc_1       exception;
    exc_2       exception;
    exc_3       exception;

    pragma exception_init(exc_1, -20000); -- Note exc_1 and exc_2 are both associated
    pragma exception_init(exc_2, -20000); -- with the same error code.
    pragma exception_init(exc_3, -20100); --

    procedure raise_exc_1;
    procedure raise_exc_2;
    procedure raise_exc_3;

    procedure raise_exc_i;

    procedure raise_app_error(error_code number);

end tq84_thrower;
/
