alter system set query_rewrite_integrity=trusted  scope=memory;
alter system set query_rewrite_enabled  =force    scope=memory;

select
   txt,
   num
from
   tq84_rewrite_tab_1;

select
   txt,
   num / 2 as num
from
   tq84_rewrite_tab_1;
