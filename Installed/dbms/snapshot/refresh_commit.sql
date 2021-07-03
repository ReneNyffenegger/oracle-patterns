create table tq84_r1 (
   a   varchar2(3),
   b   number
);

insert into tq84_rl values ('foo',   1);
insert into tq84_r1 values ('foo',   2);
insert into tq84_r1 values ('foo',   3);

insert into tq84_r1 values ('bar',  40);
insert into tq84_r1 values ('bar',  50);

insert into tq84_r1 values ('baz', 100);

create materialized view tq84_mv
   refresh force on demand
as
   select
      a,
      sum(b) sum_b
  from
     tq84_r1
  group by
     a;

insert into tq84_r1 values ('foo',  4);
insert into tq84_r1 values ('bar', 10);

select * from tq84_mv;

create procedure refresh_ as
    dummy number;
begin
    dbms_snapshot.refresh('tq84_mv');

--  Refresh stays in effect, although next line
--  throws error:
    dummy := 42/0;
end refresh_;
/

exec refresh_;
select * from tq84_mv;
rollback;
select * from tq84_mv;

drop procedure refresh_;
drop materialized view tq84_mv;
drop table tq84_r1;
