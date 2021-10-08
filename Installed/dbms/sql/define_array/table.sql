create table tq84_dbms_sql_array_test (
   num number,
   txt varchar2(10),
   dat date
);

insert into tq84_dbms_sql_array_test
select
   level,
   to_char(to_date(level, 'J'), 'JSP'), -- Spell number
   sysdate - level * 4.3
from
   dual
connect by
   level <= 12;
