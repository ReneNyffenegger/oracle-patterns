create or replace package tq84_pkg_a as

    procedure prc_1; pragma deprecate(prc_1, 'Don''t use tq84_pkg_a.prc_1, use prc_2');
    procedure prc_2;

end tq84_pkg_a;
/
