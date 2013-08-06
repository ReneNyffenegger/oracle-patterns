create table tq84_insert_all (
  a number,
  b varchar2(10)
);

insert all
  into tq84_insert_all values (1, 'one'  )
  into tq84_insert_all values (2, 'two'  )
  into tq84_insert_all values (3, 'three')
select 1 from dual;

select * from tq84_insert_all;

drop table tq84_insert_all purge;
