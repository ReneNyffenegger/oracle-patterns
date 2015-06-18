--
--  12345 seconds are 3 hours, 25 minutes and 45 seconds.
--
--  http://stackoverflow.com/a/13030680/180275
--
select to_char(
           to_date(12345, 'sssss'),
          'hh24:mi:ss'
       )
from dual;
