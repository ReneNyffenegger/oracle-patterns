create or replace package body tq84_pkg_b as

    procedure run is
    begin
        tq84_pkg_a.prc_1;
    end run;

end tq84_pkg_b;
/
