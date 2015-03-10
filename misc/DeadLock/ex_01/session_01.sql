create table tq84_deadlock (
  col1  number        primary key,
  col2  varchar2(20)
);

insert into tq84_deadlock values (1, 'foo');
insert into tq84_deadlock values (2, 'bar');

commit;

select rowid, col1, col2 from tq84_deadlock;

update tq84_deadlock set col2 = 'Session 1' where col1=1;

accept dummy char prompt "Run 2nd session now, then press enter here "

update tq84_deadlock set col2 = 'Session 1' where col1=2;

drop table tq84_deadlock purge;
