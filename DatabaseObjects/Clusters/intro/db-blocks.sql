select
-- rowid,
   dbms_rowid.rowid_block_number   (rowid) block_no,
   dbms_rowid.rowid_row_number     (rowid) row_no,
   dbms_rowid.rowid_relative_fno   (rowid) rel_fno,
   case dbms_rowid.rowid_type      (rowid)
   when 0 then 'restricted'
   else        'extended'   end            type_,
   r.*
from
  tq84_cluster_child r;
  
select
-- rowid,
   dbms_rowid.rowid_block_number   (rowid) block_no,
   dbms_rowid.rowid_row_number     (rowid) row_no,
   dbms_rowid.rowid_relative_fno   (rowid) rel_fno,
   case dbms_rowid.rowid_type      (rowid)
   when 0 then 'restricted'
   else        'extended'   end            type_,
   r.*
from
  tq84_cluster_parent r;

