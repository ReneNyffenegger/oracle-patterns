create table tq84_sample_src (
  id number
);

insert into tq84_sample_src
select level from dual
connect by level <= 1000;

select count(*) from tq84_sample_src;
-- 1000

create table tq84_sample_dest as
select * from tq84_sample_src sample (5);

select count(*) from tq84_sample_dest;
-- 52

drop table tq84_sample_src  purge;
drop table tq84_sample_dest purge;
