
create table tq84_part_interval_list (
  id   number,
  txt  varchar2(10),
  cat  varchar2( 3),
  dt   date
)
partition by range (dt) interval (numtoyminterval(1, 'month'))
    subpartition by list (cat)
        subpartition template (
          subpartition foo values ('foo'),
          subpartition bar values ('bar'),
          subpartition baz values ('baz')
        )
(
  partition values less than ( date '2017-01-01') 
);

insert into tq84_part_interval_list values (1, 'abc', 'foo', date '2017-03-01');
insert into tq84_part_interval_list values (2, 'def', 'bar', date '2017-03-02');
insert into tq84_part_interval_list values (3, 'ghi', 'baz', date '2017-03-03');
insert into tq84_part_interval_list values (4, 'jkl', 'foo', date '2017-12-01');
insert into tq84_part_interval_list values (5, 'mno', 'bar', date '2017-12-02');
insert into tq84_part_interval_list values (6, 'pqr', 'baz', date '2017-12-03');

select * from user_tab_subpartitions where table_name = 'TQ84_PART_INTERVAL_LIST';

drop table tq84_part_interval_list purge;
