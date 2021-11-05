select
   distinct statistic_name
from
   v$segment_statistics
                                    minus
select
   name
from
   v$segstat_name;

---

select
   name
from
   v$segstat_name
                                    minus
select
   distinct statistic_name
from
   v$segment_statistics
;
