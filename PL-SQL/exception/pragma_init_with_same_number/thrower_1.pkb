create or replace package body tq84_thrower_1 as

    procedure go is begin
        raise_application_error(-20777, 'Package is tq84_thrower_1');
    end go;

end tq84_thrower_1;
/
