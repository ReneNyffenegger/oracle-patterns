create or replace package tq84_pkg_commit_test as

    procedure do_something(val number);

end tq84_pkg_commit_test;
/

create or replace package body tq84_pkg_commit_test as

    procedure do_something(val number) is
    begin

        if val = -1 then
           commit;
           return;
        end if;

        if val = -2 then
           rollback;
           return;
        end if;

        insert into tq84_tab_commit_test values (val);

    end do_something;

end tq84_pkg_commit_test;
/
show errors
