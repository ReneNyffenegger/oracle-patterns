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

select
  o.subobject_name,
  r.*
from
  tq84_part_interval_list r     join
  user_objects            o on dbms_rowid.rowid_object(r.rowid) =
                               o.data_object_id;


drop table tq84_part_interval_list purge;
