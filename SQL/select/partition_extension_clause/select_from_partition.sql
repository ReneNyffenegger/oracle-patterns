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
-- COL_P      DAT
-- ---------- ----------
-- bar        two
-- bar        five

drop table tq84_partitioned purge;

create table tq84_partitioned (
  col_p  varchar2(10),
  dat    date
) partition by range(dat) (
  partition part_min values less than (date '9999-12-31'),
  partition part_max values less than (maxvalue         )
);


insert into tq84_partitioned values ('sysdate'   , sysdate         );
insert into tq84_partitioned values ('null'      , null            );
insert into tq84_partitioned values ('9999-12-31',date '9999-12-31');
insert into tq84_partitioned values ('9999-12-30',date '9999-12-30');

select * from tq84_partitioned partition(part_min);
-- COL_P      DAT
-- ---------- -------------------
-- sysdate    12.10.2016 10:01:46
-- 9999-12-30 30.12.9999 00:00:00

select * from tq84_partitioned partition(part_max);
-- COL_P      DAT
-- ---------- -------------------
-- null
-- 9999-12-31 31.12.9999 00:00:00

drop table tq84_partitioned purge;
