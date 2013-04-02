--
--     Demonstrates that procedure running under
--    «pragma autonomous_transaction» does not see
--     un-commited data, EVEN if is the "same session"
--


create table tq84_auto_tbl (
  id  number,
  txt varchar2(20)
);

create or replace package tq84_auto_pck as

    procedure a;
    procedure b;

end tq84_auto_pck;
/

create or replace package body tq84_auto_pck as

    procedure a is -- {
      pragma autonomous_transaction;
    begin

        for r in (select txt from tq84_auto_tbl order by id) loop

            dbms_output.put_line('autonomous_transaction: ' || r.txt);

        end loop;

    end a; -- }

    procedure b is -- {
    begin

        insert into tq84_auto_tbl values (1, 'commited');
        insert into tq84_auto_tbl values (2, 'commited, too');

        commit;

        insert into tq84_auto_tbl values (3, 'not commited');
        insert into tq84_auto_tbl values (4, 'neither commited');

        a;

    end b; -- }

end tq84_auto_pck;
/


exec tq84_auto_pck.b;

drop package tq84_auto_pck;
drop table   tq84_auto_tbl purge;
