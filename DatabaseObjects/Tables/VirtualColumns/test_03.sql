create or replace package tq84_virtual_test_pck_3 as

          function not_really_deterministic(c1_ in number) return date deterministic;

end tq84_virtual_test_pck_3;
/

create or replace package body tq84_virtual_test_pck_3 as

          function not_really_deterministic(c1_ in number) return date deterministic is
          begin
                   return sysdate; /* Now, that's sick! */
          end not_really_deterministic;

end tq84_virtual_test_pck_3;
/


create table tq84_virtual_test_3 (
       c1    number,
       dt    as (tq84_virtual_test_pck_3.not_really_deterministic(c1))
);

create index tq84_virtual_test_3_ix on tq84_virtual_test_3 (dt);

insert into tq84_virtual_test_3 (c1) values (1);
exec dbms_lock.sleep(10);

insert into tq84_virtual_test_3 (c1) values (2);
exec dbms_lock.sleep(10);

insert into tq84_virtual_test_3 (c1) values (3);
exec dbms_lock.sleep(10);

insert into tq84_virtual_test_3 (c1) values (4);
exec dbms_lock.sleep(10);

insert into tq84_virtual_test_3 (c1) values (5);
exec dbms_lock.sleep(10);

insert into tq84_virtual_test_3 (c1) values (6);
exec dbms_lock.sleep(10);

insert into tq84_virtual_test_3 (c1) values (7);
exec dbms_lock.sleep(10);

insert into tq84_virtual_test_3 (c1) values (8);
exec dbms_lock.sleep(10);

insert into tq84_virtual_test_3 (c1) values (9);
exec dbms_lock.sleep(10);

with m as (
   -- Find max insert statement...
   select /*+ index(t dt) */ max(dt) ax from tq84_virtual_test_3 t 
)
select /*+ index(t dt) */ c1 from
tq84_virtual_test_3 t, m
where t.dt > m.ax - 45 / 24/60/60;

drop table   tq84_virtual_test_3;
