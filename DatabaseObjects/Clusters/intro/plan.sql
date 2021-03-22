explain plan for
select
   p.id,
   p.dt,
   c.tx
from
   tq84_cluster_parent p                       left join
   tq84_cluster_child  c on p.id = c.id;
   
select * from table(dbms_xplan.display);
--
-- ---------------------------------------------------------------------------------------------
-- | Id  | Operation             | Name                | Rows  | Bytes | Cost (%CPU)| Time     |
-- ---------------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT      |                     |     6 |   462 |     6   (0)| 00:00:01 |
-- |   1 |  NESTED LOOPS OUTER   |                     |     6 |   462 |     6   (0)| 00:00:01 |
-- |   2 |   TABLE ACCESS FULL   | TQ84_CLUSTER_PARENT |     3 |    66 |     3   (0)| 00:00:01 |
-- |*  3 |   TABLE ACCESS CLUSTER| TQ84_CLUSTER_CHILD  |     2 |   110 |     1   (0)| 00:00:01 |
-- ------------------------------------------------------------------------------------------
