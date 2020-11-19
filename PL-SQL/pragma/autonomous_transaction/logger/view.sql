create or replace view tq84_log_view as
select
   txt,
   extract(day    from (systimestamp - ts)) days_ago   ,
   extract(hour   from (systimestamp - ts)) hours_ago  ,
   extract(minute from (systimestamp - ts)) minutes_ago,
   extract(second from (systimestamp - ts)) seconcs_ago,
   id
from
   tq84_log_table
order by
   id desc;
