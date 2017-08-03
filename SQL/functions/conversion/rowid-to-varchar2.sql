create table tq84_rowid (
  id    number,
  col_1 varchar2(20)
);

insert into tq84_rowid values(1, 'foo');
insert into tq84_rowid values(2, 'bar');
insert into tq84_rowid values(3, 'baz');


select
  rowid,
  rowidtochar(rowid) c
from
  tq84_rowid r;
  
  
drop table tq84_rowid;
