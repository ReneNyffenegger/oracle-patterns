merge into tq84_merge_destination       dest
using (select * from tq84_merge_source) src
on (dest.col1 = src.col1)
when matched then
     update set dest.col2 = src.col2
when not matched then
     insert (dest.col1, dest.col2) values (src.col1, src.col2);
