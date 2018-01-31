set timing on

drop table tq84_stage purge;
drop table tq84_clustering;

create table tq84_stage as
select
  c                      flag,
  lpad('x', 1000, 'x')   data_1,
  lpad('x', 1000, 'y')   data_2
from (
  select
    chr(ascii('m') + 2.7 * dbms_random.normal) c
  from
    dual
  connect by level < 100000
)
where
  c between 'a' and 'z';

commit;
  

create table tq84_clustering (
  flag   varchar2(   1) not null,
  data_1 varchar2(1000) not null,
  data_2 varchar2(1000) not null
)
clustering by linear order(flag)
  yes on load
  yes on data movement
;

insert /*+ append clustering */ into tq84_clustering
select * from tq84_stage;
commit;

select
  tab,
--max_block_no,
--min_block_no,
  max_block_no - min_block_no   diff_block_no,
  cnt_dist_block_no,
  max_rel_fno,
  min_rel_fno
from (
  select
   'stage'                                        as      tab,
    min  (         dbms_rowid.rowid_relative_fno (rowid)) min_rel_fno,
    max  (         dbms_rowid.rowid_relative_fno (rowid)) max_rel_fno,
    min  (         dbms_rowid.rowid_block_number (rowid)) min_block_no,
    max  (         dbms_rowid.rowid_block_number (rowid)) max_block_no,
    count(distinct dbms_rowid.rowid_block_number (rowid)) cnt_dist_block_no
  from
    tq84_stage
  where
    flag = 'g'
union all
  select
   'clustering'                                  as       tab,
    min  (         dbms_rowid.rowid_relative_fno (rowid)) min_rel_fno,
    max  (         dbms_rowid.rowid_relative_fno (rowid)) max_rel_fno,
    min  (         dbms_rowid.rowid_block_number (rowid)) min_block_no,
    max  (         dbms_rowid.rowid_block_number (rowid)) max_block_no,
    count(distinct dbms_rowid.rowid_block_number (rowid)) cnt_dist_block_no
  from
    tq84_clustering
  where
    flag = 'g'
);

