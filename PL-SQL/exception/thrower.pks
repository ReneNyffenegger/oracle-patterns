create or replace package tq84_thrower as

    exc         exception;

    procedure might_throw        (do boolean);
    procedure might_throw_another(do boolean);

end tq84_thrower;
/
