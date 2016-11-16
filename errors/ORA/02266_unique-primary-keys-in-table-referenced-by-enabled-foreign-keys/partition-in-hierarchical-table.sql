create table tq84_range_partition (
  id     number       not null,
  id_ref number,
  txt    varchar2(10) not null,
  dt     date         not null,
  --
  constraint tq84_range_partition_pk primary key (id    ),
  constraint tq84_range_partition_fk foreign key (id_ref) references tq84_range_partition
)
partition by range (dt) (
  partition tq84_range_partition_2014 values less than (date '2015-01-01'),
  partition tq84_range_partition_2015 values less than (date '2016-01-01'),
  partition tq84_range_partition_2016 values less than (date '2017-01-01'),
  partition tq84_range_partition_2017 values less than (date '2018-01-01')
);


   insert into tq84_range_partition values (1, null, 'root', date '2014-08-28');
-- insert into tq84_range_partition values (2,    1, 'chld', date '2015-02-17');

-- ORA-02266: unique/primary keys in table referenced by enabled foreign keys
alter table tq84_range_partition drop partition tq84_range_partition_2014;

drop table tq84_range_partition purge;
