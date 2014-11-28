set exitcommit on

drop table tq84_exitcommit purge;

create table tq84_exitcommit (a number);

insert into tq84_exitcommit values (1);
insert into tq84_exitcommit values (2);

commit;

insert into tq84_exitcommit values (3);
insert into tq84_exitcommit values (4);

exit
