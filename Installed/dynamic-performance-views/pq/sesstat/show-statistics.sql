select * from v$pq_sesstat order by statistic;

select /*+ parallel */ count(*) from all_objects;

select * from v$pq_sesstat order by statistic;
