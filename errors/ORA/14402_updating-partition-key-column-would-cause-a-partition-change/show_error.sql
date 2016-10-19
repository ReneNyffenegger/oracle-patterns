create table tq84_ora_14402 (
  id   number,
  dt   date
)
partition by range (dt) (
  partition part_a values less than (date '2015-01-01'),
  partition part_b values less than (      maxvalue   )
)
-- disable row movement (default?)
;

select row_movement from user_tables
where lower(table_name) = 'tq84_ora_14402';
-- DISABLED

insert into tq84_ora_14402 values (1, date '2014-08-28');
insert into tq84_ora_14402 values (2, date '2021-03-12');

commit;

update tq84_ora_14402 set dt = date '2019-12-07' where id = 2;

-- Provoke an error
-- ORA-14402: updating partition key column would cause a partition change
update tq84_ora_14402 set dt = date '2018-04-21' where id = 1;

alter table tq84_ora_14402 enable row movement;

select row_movement from user_tables
where lower(table_name) = 'tq84_ora_14402';
-- ENABLED

-- Update statement now works:
update tq84_ora_14402 set dt = date '2018-04-21' where id = 1;

drop table tq84_ora_14402 purge;
