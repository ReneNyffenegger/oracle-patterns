create table tq84_dump_block_test (
   num   number,
   txt   varchar2(20),
   dat   date
);

insert into tq84_dump_block_test values (1, 'one'  , date '2001-01-01');
insert into tq84_dump_block_test values (2, 'two'  , date '2002-02-02');
insert into tq84_dump_block_test values (3, 'three', date '2003-03-03');
insert into tq84_dump_block_test values (4, 'four' , date '2004-04-04');
insert into tq84_dump_block_test values (5, 'five' , date '2005-05-05');

commit;


declare
   rowid_  rowid;
begin

   select
      rowid into rowid_
   from
      tq84_dump_block_test
   where
      rownum = 1;

   dump_block_from_rowid(rowid_, p_symbolic => true);

end;
/

drop table tq84_dump_block_test;
