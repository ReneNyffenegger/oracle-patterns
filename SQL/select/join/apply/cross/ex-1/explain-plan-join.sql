explain plan for
select
   l.text,
   sum(r.val) total
from
   tq84_left  l                      left join
   tq84_right r on l.id = r.id_left
group by
   l.text;

select * from table(dbms_xplan.display);
--
-- ----------------------------------------------------------------------------------
-- | Id  | Operation           | Name       | Rows  | Bytes | Cost (%CPU)| Time     |
-- ----------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT    |            |     6 |   282 |     7  (15)| 00:00:01 |
-- |   1 |  HASH GROUP BY      |            |     6 |   282 |     7  (15)| 00:00:01 |
-- |*  2 |   HASH JOIN OUTER   |            |     6 |   282 |     6   (0)| 00:00:01 |
-- |   3 |    TABLE ACCESS FULL| TQ84_LEFT  |     3 |    63 |     3   (0)| 00:00:01 |
-- |   4 |    TABLE ACCESS FULL| TQ84_RIGHT |     6 |   156 |     3   (0)| 00:00:01 |
-- ----------------------------------------------------------------------------------
