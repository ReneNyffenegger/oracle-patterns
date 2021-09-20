create or replace package tq84_pkg as

    function f_non_deterministic (p in number) return number;
    function f_deterministic     (p in number) return number deterministic;

end tq84_pkg;
/

create or replace package body tq84_pkg as

    function f_non_deterministic (p in number) return number is
    begin
        dbms_lock.sleep(1);
        return p*2;
    end f_non_deterministic;

    function f_deterministic     (p in number) return number deterministic is
    begin
        dbms_lock.sleep(1);
        return p*2;
    end f_deterministic;

end tq84_pkg;
/
