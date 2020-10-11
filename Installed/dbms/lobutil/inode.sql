create table lu (
   c clob
);

declare
   c  clob;

begin

   dbms_lob.createTemporary(c, true);
   dbms_lob.append(c, 'foo bar baz');
   insert into lu values (c);

end;
/


select
   t.inode.lobid   lobid,
   t.inode.flags   flags,
   t.inode.length  length,
   t.inode.version version,
   t.inode.extents extents,
   t.inode.lhb     lhb        -- lhb dba
from (
   select
      dbms_lobutil.getInode(c) as inode
   from
      lu
) t;

drop table lu;
