select
  id,
  name,
  description
from
  v$hm_check
order by
  lower(name);
--
-- 14   All Datafiles Check            Checks all datafiles in the database
-- 18   Archived Log Check             Checks an archived log
-- 27   ASM Allocation Check           Diagnose allocation failure
-- 28   ASM Disk Visibility Check      Diagnose add disk failure
-- 29   ASM File Busy Check            Diagnose file drop failure
-- 33   ASM Insufficient Disks Check   Diagnose mount failed because there were insufficient disks
-- 26   ASM Mount Check                Diagnose mount failure
-- 32   ASM Toomanyoff Check           Diagnose mount failed because there were too many offline disks
-- 21   Block IO Revalidation Check    Checks file accessibility
-- 25   CF Block Integrity Check       Checks integrity of a control file block
-- 13   CF Member Check                Checks a multiplexed copy of the control file
--  3   Data Block Integrity Check     Checks integrity of a data file block
--  2   DB Structure Integrity Check   Checks integrity of all database files
-- 24   Dictionary Integrity Check     Checks dictionary integrity
-- 23   Failure Simulation Check       Creates dummy failures
--  1   HM Test Check                  Check for health monitor functionality
-- 20   IO Revalidation Check          Checks file accessibility
-- 16   Log Group Check                Checks all members of a log group
-- 17   Log Group Member Check         Checks a particular member of a log group
--  5   Logical Block Check            Checks logical content of a block
-- 31   Mount CF Check                 Checks control file in mount mode
-- 12   No Mount CF Check              Checks control file in NOMOUNT mode
--  4   Redo Integrity Check           Checks integrity of redo log content
-- 19   Redo Revalidation Check        Checks redo log content
-- 15   Single Datafile Check          Checks a data file
-- 30   Tablespace Check Check         Checks a tablespace
-- 10   Transaction Integrity Check    Checks a transaction for corruptions
-- 22   Txn Revalidation Check         Revalidate corrupted transaction
-- 11   Undo Segment Integrity Check   Checks integrity of an undo segment
