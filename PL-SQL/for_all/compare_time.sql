create table tq84_for_all (
  col_1 number       primary key,
  col_2 varchar2(10)
);

create or replace package tq84_for_all_pkg as

  procedure run_without;
  procedure run_with;

end tq84_for_all_pkg;
/

create or replace package body tq84_for_all_pkg as

  procedure run_without is -- {
    t0 number;
    t1 number;
  begin

    t0 := dbms_utility.get_time;

    for i in 1 .. 100000 loop

      insert into tq84_for_all values(i, 'foo ' || i);

    end loop;

    t1 := dbms_utility.get_time;

    dbms_output.put_line('Without: ' || ((t1-t0) / 100) || ' seconds');

  end run_without; -- }

  procedure run_with is -- {
     type vals_t is table of tq84_for_all%rowtype index by pls_integer;
     vals vals_t;

    t0 number;
    t1 number;

  begin

    t0 := dbms_utility.get_time;

    for i in 1 .. 100000 loop

       vals(i).col_1 :=  i + 100000;
       vals(i).col_2 := 'foo ' || i;

    end loop;

    forall i in 1 .. 10000 insert into tq84_for_all values vals(i); -- (vals(i).col_1, vals(i).col_2);

    t1 := dbms_utility.get_time;
    dbms_output.put_line('With   : ' || ((t1-t0) / 100) || ' seconds');

  end run_with; -- }

end tq84_for_all_pkg;
/
show errors;

exec tq84_for_all_pkg.run_without
exec tq84_for_all_pkg.run_with

drop table tq84_for_all purge;
drop package tq84_for_all_pkg;
