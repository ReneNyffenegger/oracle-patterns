column name        format a25
column description format a60

select distinct
   name,
   description
from
   dba_high_water_mark_statistics
order by
   lower(name)
;

-- NAME                      DESCRIPTION
-- ------------------------- ------------------------------------------------------------
-- ACTIVE_SESSIONS           Maximum Average Active Sessions - estimated
-- CPU_COUNT                 Maximum Number of CPUs
-- DATAFILES                 Maximum Number of Datafiles
-- DB_SIZE                   Maximum Size of the Database (Bytes)
-- EXADATA_DISKS             Number of physical disks
-- Flex ASM                  Number of completed and successful failovers
-- GLOBAL SERVICES           Number of global services
-- HWM_DBMS_SCHEDULER        Number of job runs per day
-- INSTANCES                 Oracle Database instances
-- PART_INDEXES              Maximum Number of Partitions belonging to an User Index
-- PART_TABLES               Maximum Number of Partitions belonging to an User Table
-- PRIMARY SHARDS            Number of deployed primary shards in catalog
-- QUERY_LENGTH              Maximum Query Length
-- SEGMENT_SIZE              Size of Largest Segment (Bytes)
-- SESSIONS                  Maximum Number of Concurrent Sessions seen in the database
-- SHARDS                    Number of deployed shards in catalog
-- SQL_NCHAR_COLUMNS         Maximum Number of SQL NCHAR Columns
-- TABLESPACES               Maximum Number of Tablespaces
-- USER_INDEXES              Number of User Indexes
-- USER_MV                   Maximum Number of Materialized Views (User)
-- USER_TABLES               Number of User Tables
