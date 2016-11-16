select distinct
  name,
  description
from
  dba_high_water_mark_statistics
order by
  lower(name);
--
-- ACTIVE_SESSIONS    	 Maximum Number of Active Sessions seen in the system
-- CPU_COUNT          	 Maximum Number of CPUs
-- DATAFILES          	 Maximum Number of Datafiles
-- DB_SIZE            	 Maximum Size of the Database (Bytes)
-- EXADATA_DISKS      	 Number of physical disks
-- HWM_DBMS_SCHEDULER 	 number of job runs per day
-- INSTANCES          	 Oracle Database instances
-- PART_INDEXES       	 Maximum Number of Partitions belonging to an User Index
-- PART_TABLES        	 Maximum Number of Partitions belonging to an User Table
-- QUERY_LENGTH       	 Maximum Query Length
-- SEGMENT_SIZE       	 Size of Largest Segment (Bytes)
-- SESSIONS           	 Maximum Number of Concurrent Sessions seen in the database
-- SQL_NCHAR_COLUMNS  	 Maximum Number of SQL NCHAR Columns
-- TABLESPACES        	 Maximum Number of Tablespaces
-- USER_INDEXES       	 Number of User Indexes
-- USER_MV            	 Maximum Number of Materialized Views (User)
-- USER_TABLES        	 Number of User Tables
