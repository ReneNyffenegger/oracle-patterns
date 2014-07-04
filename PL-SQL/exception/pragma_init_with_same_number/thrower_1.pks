create or replace package tq84_thrower_1 as

    procedure go;

    exc exception; 
    pragma exception_init(exc, -20777);

end tq84_thrower_1;
/
