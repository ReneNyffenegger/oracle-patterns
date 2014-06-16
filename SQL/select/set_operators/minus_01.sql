create table tq84_minus_1 (
  val  number
);

create table tq84_minus_2 (
  val  number
);


insert into tq84_minus_1 values (1);
insert into tq84_minus_1 values (2);
insert into tq84_minus_1 values (2);
insert into tq84_minus_1 values (3);
insert into tq84_minus_1 values (3);
insert into tq84_minus_1 values (3);

insert into tq84_minus_2 values (2);


--   Note,
--     each distinct values is returned once only,
--     although inserted multiple times into tq84_minus_1
--    (especially the value 3).
--
select * from tq84_minus_1 minus
select * from tq84_minus_2;

drop table tq84_minus_1 purge;
drop table tq84_minus_2 purge;
