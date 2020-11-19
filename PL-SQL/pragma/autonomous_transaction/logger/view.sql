create or replace view tq84_log_view as
select
   txt,
   extract(second from (systimestamp - ts)) sec_ago,
   id
from
   tq84_log_table
order by
   id desc;
