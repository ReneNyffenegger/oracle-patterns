create table tq84_table_with_lobs (
   id    integer,
   vc    varchar2(20),
   bb    blob,
   cb    clob,
   dt    date,
   bf    bfile
);

select
-- lob.table_name,
   lob.column_name,
   lob.in_row,
   lob.deduplication,
   lob.format,
   lob.chunk,
   lob.segment_name,
   lob.tablespace_name,
   lob.index_name,
   lob.pctversion,
   lob.retention,
   lob.freepools,
   lob.cache,
   lob.logging,
   lob.encrypt,
   lob.compression,
   lob.partitioned,
   lob.securefile,
   lob.segment_created,
   lob.retention_type,
   lob.retention_value
from
   user_lobs lob
where
   lob.table_name = 'TQ84_TABLE_WITH_LOBS';

drop table tq84_table_with_lobs;
