explain plan for
select
   l.text,
   a.total
from
   tq84_left l cross apply
  (select
      sum(r.val) total
   from
      tq84_right r
   where
      r.id_left = l.id
  ) a;

select * from table(dbms_xplan.display);
--
-- ----------------------------------------------------------------------------------------
-- | Id  | Operation            | Name            | Rows  | Bytes | Cost (%CPU)| Time     |
-- ----------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT     |                 |     6 |   282 |     7  (15)| 00:00:01 |
-- |*  1 |  HASH JOIN OUTER     |                 |     6 |   282 |     7  (15)| 00:00:01 |
-- |   2 |   TABLE ACCESS FULL  | TQ84_LEFT       |     3 |    63 |     3   (0)| 00:00:01 |
-- |   3 |   VIEW               | VW_DCL_535DE542 |     6 |   156 |     4  (25)| 00:00:01 |
-- |   4 |    HASH GROUP BY     |                 |     6 |   156 |     4  (25)| 00:00:01 |
-- |   5 |     TABLE ACCESS FULL| TQ84_RIGHT      |     6 |   156 |     3   (0)| 00:00:01 |
-- ----------------------------------------------------------------------------------------
