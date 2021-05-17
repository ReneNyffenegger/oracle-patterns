explain plan for
select *
from
   tq84_list_partition 
 where
   sector = 'West';


select * from table(dbms_xplan.display);
--
-- -------------------------------------------------------------------------------------------------------------
-- | Id  | Operation             | Name                | Rows  | Bytes | Cost (%CPU)| Time     | Pstart| Pstop |
-- -------------------------------------------------------------------------------------------------------------
-- |   0 | SELECT STATEMENT      |                     |     1 |    57 |   274   (0)| 00:00:01 |       |       |
-- |   1 |  PARTITION LIST SINGLE|                     |     1 |    57 |   274   (0)| 00:00:01 |   KEY |   KEY |
-- |   2 |   TABLE ACCESS FULL   | TQ84_LIST_PARTITION |     1 |    57 |   274   (0)| 00:00:01 |     2 |     2 |
-- -------------------------------------------------------------------------------------------------------------
