create table tq84_chained_row_test (
  id    number,
  data_ varchar2(4000)
)
pctfree 10 -- default
;

create table chained_rows (
  owner_name         varchar2(30),
  table_name         varchar2(30),
  cluster_name       varchar2(30),
  partition_name     varchar2(30),
  subpartition_name  varchar2(30),
  head_rowid         rowid,
  analyze_timestamp  date
);


begin
  for i in 1 .. 100 loop
    insert into tq84_chained_row_test values (i, lpad('x', 500, 'x'));
  end loop;
end;
/
commit;


analyze table tq84_chained_row_test list chained rows;

select * from chained_rows;
--
-- No chained rows found.
--

update tq84_chained_row_test set data_ = lpad('y', 4000, 'y') where id in (37, 89);

analyze table tq84_chained_row_test list chained rows;


select t.id from tq84_chained_row_test t
where
  t.rowid in (select head_rowid from chained_rows);
--
--       ID
-- --------
--       37
--       89
--

drop table chained_rows          purge;
drop table tq84_chained_row_test purge;
