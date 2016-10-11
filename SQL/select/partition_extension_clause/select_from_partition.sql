create table tq84_partitioned (
  col_p  varchar2(10),
  dat    varchar2(10)
) partition by list(col_p) (
  partition part_foo values ('foo'),
  partition part_bar values ('bar'),
  partition part_baz values ('baz')
);


insert into tq84_partitioned values ('foo', 'one'  );
insert into tq84_partitioned values ('bar', 'two'  );
insert into tq84_partitioned values ('baz', 'three');
insert into tq84_partitioned values ('foo', 'four' );
insert into tq84_partitioned values ('bar', 'five' );
insert into tq84_partitioned values ('baz', 'six'  );

select * from tq84_partitioned partition(part_bar);

drop table tq84_partitioned;
