create table tq84_src (
  valid_from date not null,
  valid_to   date not null,
  item       varchar2(10)
);

insert into tq84_src values (date '0001-01-01', date '9999-12-31', 'both'     );
insert into tq84_src values (date '1990-01-01', date '1995-12-31', 'none'     );
insert into tq84_src values (date '2015-01-01', date '2015-12-31', '2015 only');
insert into tq84_src values (date '2016-01-01', date '2016-12-31', '2016 only');

create table tq84_dst_2015_12_31 as select * from tq84_src where 1 = 0;
create table tq84_dst_2016_01_01 as select * from tq84_src where 1 = 0;

-- select * from tq84_src where date '2015-12-31' between valid_from and valid_to;
-- select * from tq84_src where date '2016-01-01' between valid_from and valid_to;

insert all
  when date '2015-12-31' between valid_from and valid_to then into tq84_dst_2015_12_31
  when date '2016-01-01' between valid_from and valid_to then into tq84_dst_2016_01_01
select * from
  tq84_src;

select * from tq84_dst_2015_12_31;
-- VALID_FR VALID_TO ITEM
-- -------- -------- ----------
-- 01.01.01 31.12.99 both
-- 01.01.15 31.12.15 2015 only

select * from tq84_dst_2016_01_01;
-- VALID_FR VALID_TO ITEM
-- -------- -------- ----------
-- 01.01.01 31.12.99 both
-- 01.01.16 31.12.16 2016 only

drop table tq84_dst_2016_01_01 purge;
drop table tq84_dst_2015_12_31 purge;


create table tq84_dst_2015_12_31 (valid_from date, item varchar2(10));
create table tq84_dst_2016_01_01 (valdi_to   date, item varchar2(10));

insert all
  when date '2015-12-31' between valid_from and valid_to then into tq84_dst_2015_12_31 values (valid_from, item) 
  when date '2016-01-01' between valid_from and valid_to then into tq84_dst_2016_01_01 values (valid_to  , item) 
select * from
  tq84_src;

select * from tq84_dst_2015_12_31;
-- VALID_FR ITEM
-- -------- ----------
-- 01.01.01 both
-- 01.01.15 2015 only

select * from tq84_dst_2016_01_01;
-- VALDI_TO ITEM
-- -------- ----------
-- 31.12.99 both
-- 31.12.16 2016 only

drop table tq84_dst_2016_01_01 purge;
drop table tq84_dst_2015_12_31 purge;

drop table tq84_src purge;
