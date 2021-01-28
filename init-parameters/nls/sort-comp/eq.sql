drop   table tq84_nls_sort_comp_test purge;
create table tq84_nls_sort_comp_test (
   text varchar2(10)
);

insert into tq84_nls_sort_comp_test values ('René');
insert into tq84_nls_sort_comp_test values ('Rene');
insert into tq84_nls_sort_comp_test values ('RENÉ');
insert into tq84_nls_sort_comp_test values ('RENE');

create or replace view tq84_nls_sort_comp_test_v as
select
   t1.text t1,
   t2.text t2
from
   tq84_nls_sort_comp_test t1 join
   tq84_nls_sort_comp_test t2 on t1.text = t2.text and
                                 t1.rowid <> t2.rowid;

---------------------------------------
alter session set nls_comp = binary;
alter session set nls_sort = binary;

select * from tq84_nls_sort_comp_test_v;
-- No records returned

---------------------------------------
alter session set nls_comp = linguistic;
alter session set nls_sort = binary;

select * from tq84_nls_sort_comp_test_v;
-- No records returned

----------------------------------------
alter session set nls_comp = linguistic;
alter session set nls_sort = latin;

select * from tq84_nls_sort_comp_test_v;
-- No records returned

---------------------------------------
alter session set nls_comp = linguistic;
alter session set nls_sort = latin_ci;

select * from tq84_nls_sort_comp_test_v;
--
-- RENÉ  René
-- RENE  Rene
-- René  RENÉ
-- Rene  RENE

---------------------------------------
alter session set nls_comp = linguistic;
alter session set nls_sort = latin_ai;

select * from tq84_nls_sort_comp_test_v;
--
-- Rene  René
-- RENÉ  René
-- RENE  René
-- René  Rene
-- RENÉ  Rene
-- RENE  Rene
-- René  RENÉ
-- Rene  RENÉ
-- RENE  RENÉ
-- René  RENE
-- Rene  RENE
-- RENÉ  RENE

---------------------------------------
alter session set nls_comp = binary;
alter session set nls_sort = latin_ai;

select * from tq84_nls_sort_comp_test_v;
-- No records returned
