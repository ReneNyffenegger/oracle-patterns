create table tq84_index_organized_table 
-- { relational properties
   (  
     -- { column definitions
        col_1    number,
        col_2    varchar2(20),
        col_3    date,
     -- }
     -- { out of line ref constraint 
        constraint tq84_index_organized_table_pk primary key (
          col_1, 
          col_2, 
          col_3
        )
     -- }
     -- { supplemental logging props
     -- }
   )
-- }
-- { physical properties
   -- { deferred segment creation
      segment creation immediate /* or deferred */
   -- }
   ORGANIZATION INDEX
   -- { segment attributes clause
      -- { physical attributes clause
--       pctfree  10 -- ORA-25192: invalid option for an index-organized table
--       pctused  40
         initrans  2
         -- { storage clause
            storage (
              initial     10M
              next        10M
              maxextents  unlimited
              -- { maxsize clause
              -- }
              pctincrease 0
              -- freelists
              -- freelist groups
              -- optimal
              -- buffer_pool
              -- flash_cache
              -- encrypt
            )
         -- }
      -- }
      tablespace users
      -- { logging clause
         logging
      -- }
   -- }
   -- { index org table clause
      -- { mapping table clause
      -- }
   -- PCTTHRESHOLD 0
      -- { key compression
      -- }
      -- { index org overflow clause
      -- }
   -- }
-- }
-- { table  properties
   -- { column properties
   -- }
   -- { table partitioning clause
   -- }
-- nocache ORA-25192: invalid option for an index-organized table
   -- result cache (mode default|force) 
   -- { parallel clause
   -- }
   -- rowdependencies
   -- { enable disable clause
   -- }
   -- { row movement clause
--    enable row movement ORA-14066: illegal option for a non-partitioned index-organized table
   -- }
   -- { flashback archive clause
--    no flashback archive
   -- }
-- }
/


select object_name, object_type from user_objects where object_name like 'TQ84_INDEX_ORGANIZED_TABLE%';

-- The created segment's name is the primary key's name:
select segment_name,  bytes/1024/1024 from user_segments where segment_name like 'TQ84_INDEX_ORGANIZED_TABLE%';


drop table tq84_index_organized_table purge;
