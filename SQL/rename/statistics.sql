--
-- This is a script to demonstrate that statistics are kept
-- after renaming a table.
--

create table tq84_old_name as select * from dba_tables;

exec dbms_stats.gather_table_stats(user, 'tq84_old_name');

create table tq84_stats_before_rename as select 
--table_name,
  column_name,
  endpoint_number,
  endpoint_value,
  endpoint_actual_value,
  endpoint_actual_value_raw,
  endpoint_repeat_count,
  scope
from
  user_tab_histograms
where
  lower(table_name) = 'tq84_old_name';

select count(*) from tq84_stats_before_rename;

select to_char(last_analyzed, 'hh24:mi:ss') from user_tables where lower(table_name) like 'tq84_old_name';

rename tq84_old_name to tq84_new_name;

exec dbms_lock.sleep(2);

create table tq84_stats_after_rename as select 
--table_name,
  column_name,
  endpoint_number,
  endpoint_value,
  endpoint_actual_value,
  endpoint_actual_value_raw,
  endpoint_repeat_count,
  scope
from
  user_tab_histograms
where
  lower(table_name) = 'tq84_new_name';

select to_char(last_analyzed, 'hh24:mi:ss') from user_tables where lower(table_name) like 'tq84_new_name';

select * from tq84_stats_after_rename minus
select * from tq84_stats_before_rename;

select * from tq84_stats_before_rename minus
select * from tq84_stats_after_rename;

drop table tq84_new_name             purge;
drop table tq84_stats_before_rename  purge;
drop table tq84_stats_after_rename   purge;
