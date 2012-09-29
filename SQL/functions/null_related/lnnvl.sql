create table tq84_lnnvl (
       col1  number,
       col2  number
);

insert into tq84_lnnvl values (null, null);
insert into tq84_lnnvl values (null,    1);
insert into tq84_lnnvl values (   1,    1);
insert into tq84_lnnvl values (   1,    2);

select * from tq84_lnnvl where lnnvl(col1=col2);

drop table tq84_lnnvl purge;
