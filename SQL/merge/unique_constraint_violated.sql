create table tq84_merge_dest (
  id   number,
  txt  varchar2(10),
  constraint tq84_merge_dest_pk primary key (id)
);

insert into tq84_merge_dest values (1, 'foo');
insert into tq84_merge_dest values (3, 'bar');
insert into tq84_merge_dest values (5, 'baz');

merge into tq84_merge_dest dest
using (select 1 id, 'one'    txt from dual union all
       select 2 id, 'two'    txt from dual union all
       select 4 id, 'four'   txt from dual
) src
on    (dest.id = src.id)
when matched then
     update set txt = src.txt
when not matched then
     insert (id, txt) values (src.id, src.txt)
;




merge into tq84_merge_dest dest
using (select 3 id, 'three'  txt from dual union all
--     select 6 id, 'six'    txt from dual union all -- unique constraint (META.TQ84_MERGE_DEST_PK) violated
       select 6 id, 'six'    txt from dual
) src
on    (dest.id = src.id)
when matched then
     update set txt = src.txt
when not matched then
     insert (id, txt) values (src.id, src.txt)
;

select * from tq84_merge_dest;

drop table tq84_merge_dest purge;
