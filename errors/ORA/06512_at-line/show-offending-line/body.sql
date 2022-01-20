create or replace package body tq84_err_test as

    procedure proc_3 is
    begin
        raise_application_error(-20888, 'Raising errors is easier than raising money');
    end proc_3;

    procedure proc_2 is
    begin
        proc_3;
    end proc_2;

    procedure proc_1 is
    begin
        proc_2;
    end proc_1;

    procedure go is
    begin
        proc_1;
    end go;

end tq84_err_test;
/

show errors
