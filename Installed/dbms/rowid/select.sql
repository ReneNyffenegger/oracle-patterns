create table tq84_rowid (
  id    number,
  col_1 varchar2(20)
);

insert into tq84_rowid values(1, 'foo');
insert into tq84_rowid values(2, 'bar');
insert into tq84_rowid values(3, 'baz');


select
  rowid,
  dbms_rowid.rowid_block_number   (rowid) block_no,
  dbms_rowid.rowid_row_number     (rowid) row_no,
  dbms_rowid.rowid_relative_fno   (rowid) rel_fno,
  case dbms_rowid.rowid_type      (rowid)
  when 0 then 'restricted'
  else        'extended'   end            type_,
  r.*
from
  tq84_rowid r;
  
  
drop table tq84_rowid;
