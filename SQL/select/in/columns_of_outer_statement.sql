create table tq84_in_outer (
  outer_1  number,
  outer_2  varchar2(10)
);

create table tq84_in_inner (
  inner_1  number,
  inner_2  varchar2(10)
);

insert into tq84_in_outer values (1, 'outer one');
insert into tq84_in_outer values (2, 'outer two');

insert into tq84_in_inner values (1, 'inner one');
insert into tq84_in_inner values (3, 'inner three');

select * from tq84_in_outer
where
  outer_1 in (
     select
        outer_1
      from
        tq84_in_inner
      where
        inner_1 = 1
  );
        


drop table tq84_in_outer purge;
drop table tq84_in_inner purge;
