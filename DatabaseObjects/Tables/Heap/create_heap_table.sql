create table tq84_heap_table
-- { relational properties
   (
     -- { column definitions
        col_1    number,
        col_2    varchar2(20),
        col_3    date,
        col_4    number,
     -- }
     -- { virtual column definitions
                 -- According to tahiti, virtual columns are
                 -- only possible in heap tables (at least in 11.2)
        col_5    as (col_1 + col_4),
     -- }
     -- { out of line constraint
        constraint tq84_heap_table_pk primary key (col_1)
        -- { constraint state
           not deferrable       -- or deferrable
           initially immediate  -- or initially deferred
           norely               -- or rely
           -- { using index clause
              using index
                --  SCHEMANAME.INDEXNAME    or
                -- (create index statement) or
                -- { index properties
                   online
                   tablespace users
                   -- { index attributes
                      -- { physical attributes clause
                      -- }
                      -- { logging clause
                      -- }
                   -- }
                -- }
                sort         -- or no_sort
            --  reverse
                visible      -- or invisible
                -- { parallel clause
                -- }
           -- }
           enable               -- or disable
           novalidate           -- or validate
           -- { exceptions clause
           -- }
        -- }
        ,
        constraint tq84_heap_table_fk foreign key (col_4) references tq84_heap_table
     -- }
     -- { supplemental logging props
     -- }
   )
-- }
-- { physical properties
   -- { deferred segment creation
      segment creation immediate /* or deferred */
   -- }
   ORGANIZATION HEAP     -- This is the default.
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
   -- { table compression
          compress basic
      --  compress for oltp
      --  compress for archive /* high */ low  /* ORA-64307 */
      --  compress for query high /* low */
   -- }
-- }
-- { table  properties
   -- { column properties
      -- { object type col properties
      -- }
      -- { nested table col properties
      -- }
      -- { varray col properties
         --  (lob partition storage)
      -- }
      -- { lob storage properties
         --  (lob partition storage)
      -- }
      -- { xml type column properties
      -- }
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


select object_name, object_type from user_objects where object_name like 'TQ84_HEAP_TABLE%';

-- The created segment's name is the primary key's name:
select segment_name,  bytes/1024/1024 from user_segments where segment_name like 'TQ84_HEAP_TABLE%';


drop table tq84_heap_table purge;
