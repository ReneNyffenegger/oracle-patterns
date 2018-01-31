
create table tq84_part_by_range_year  (dt date, col_1 number) partition by range (dt) interval ( numtoyminterval(1, 'year' )) (partition p_0 values less than (date '0001-01-01'));
create table tq84_part_by_range_month (dt date, col_1 number) partition by range (dt) interval ( numtoyminterval(1, 'month')) (partition p_0 values less than (date '0001-01-01'));
create table tq84_part_by_range_day   (dt date, col_1 number) partition by range (dt) interval ( numtodsinterval(1, 'day'  )) (partition p_0 values less than (date '0001-01-01'));

select col_1 from tq84_part_by_range_year  where dt between date '2008-10-01' and date '2008-10-30' or dt between date '2008-10-30' and date '2008-10-01';
/* ORA-01841: (full) year must be between -4713 and +9999, and not be 0 */

select col_1 from tq84_part_by_range_month where dt between date '2008-10-01' and date '2008-10-30' or dt between date '2008-10-30' and date '2008-10-01';
/* ORA-01841: (full) year must be between -4713 and +9999, and not be 0 */

select col_1 from tq84_part_by_range_day   where dt between date '2008-10-01' and date '2008-10-30' or dt between date '2008-10-30' and date '2008-10-01';
/* OK */

select col_1 from tq84_part_by_range_day   where
  dt between to_date ('2008-10-01 05:17:13', 'yyyy-mm-dd hh24:mi:ss') and to_date ('2008-10-01 15:17:13', 'yyyy-mm-dd hh24:mi:ss') or
  dt between to_date ('2008-10-01 15:17:13', 'yyyy-mm-dd hh24:mi:ss') and to_date ('2008-10-01 05:17:13', 'yyyy-mm-dd hh24:mi:ss');
/* OK */  
    
select col_1 from tq84_part_by_range_day   where
  dt between to_date ('2008-10-01 05:17:13', 'yyyy-mm-dd hh24:mi:ss') and to_date ('2008-10-30 15:17:13', 'yyyy-mm-dd hh24:mi:ss') or
  dt between to_date ('2008-10-30 15:17:13', 'yyyy-mm-dd hh24:mi:ss') and to_date ('2008-10-01 05:17:13', 'yyyy-mm-dd hh24:mi:ss');
/* OK */

drop table tq84_part_by_range_year  purge;
drop table tq84_part_by_range_month purge;
drop table tq84_part_by_range_day   purge;
