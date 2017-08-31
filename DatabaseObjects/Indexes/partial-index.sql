drop   table tq84_partial_index_table purge;
create table tq84_partial_index_table (
  id     number primary key,
  part   varchar2( 3) not null check (part in ('foo', 'bar', 'baz')),
  col_1  varchar2(10) not null,
  col_2  varchar2(10)
)
partition by list (part) (
  partition tq84_partial_index_part_foo values ('foo') indexing on,
  partition tq84_partial_index_part_bar values ('bar') indexing off,
  partition tq84_partial_index_part_baz values ('baz') indexing on
);

create index tq84_ix_partial_index
    on tq84_partial_index_table(col_1)
    INDEXING PARTIAL local
;

insert into tq84_partial_index_table values (1, 'foo', 'abc', 'def');
insert into tq84_partial_index_table values (2, 'bar', 'ghi', 'jkl');
insert into tq84_partial_index_table values (3, 'baz', 'mno', 'pqr');

select
  partition_name,
  status
from
  user_ind_partitions
where
  index_name = 'TQ84_IX_PARTIAL_INDEX';
