--
--  Most of the procedures in dbms_stats commit the current transaction,
--  perform the operation, and then commit again.
--

drop table tq84_tab_stat_trx purge;

create table tq84_tab_stat_trx (
  col  number
);

insert into tq84_tab_stat_trx values (1);
commit;

insert into tq84_tab_stat_trx values (2);

exec dbms_stats.gather_table_stats(user, 'tq84_tab_stat_trx', method_opt => 'for all columns size 10');

select
  num_distinct
from
  user_tab_col_statistics
where
  table_name  = 'TQ84_TAB_STAT_TRX' and
  column_name = 'COL';


rollback;

select * from tq84_tab_stat_trx;
