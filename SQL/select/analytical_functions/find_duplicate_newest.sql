--
--   Demonstration: how to find «duplicate newest entries».
--
create table tq84_t (
  id       varchar2(10),
  tm       date,
  val      number
);

--   Find each record where an id's newest tm occurs
--   more than once.



insert into tq84_t values ('foo', date '2000-05-09', 10);
insert into tq84_t values ('foo', date '2004-11-28', 12);
insert into tq84_t values ('foo', date '2012-07-15', 14);

insert into tq84_t values ('bar', date '2001-05-09',  9);
insert into tq84_t values ('bar', date '2003-02-04', 17);
insert into tq84_t values ('bar', date '2011-06-12', 16)  /* We want this and the next record, because            */;
insert into tq84_t values ('bar', date '2011-06-12', 19)  /* 2011-06-12 occurs twice and is most recent for 'bar' */ ;

insert into tq84_t values ('baz', date '2002-08-23', 21);
insert into tq84_t values ('baz', date '2005-05-19', 25)  /* We don't want this record. 2005-05-19 occurs twice for 'baz' */;
insert into tq84_t values ('baz', date '2005-05-19', 23)  /* but 2013-01-30 is newer                                      */;
insert into tq84_t values ('baz', date '2013-01-30', 13);

select * from (
  select
    id,
    tm,
    count(*)     over (partition by id,         tm     ) cnt,
    dense_rank() over (partition by id order by tm desc) dr,
    val
  from
    tq84_t
)
where
  cnt > 1 and
  dr  = 1;


drop table tq84_t purge;
