create table tq84_top_n (
  id   number primary key,
  txt  varchar2(100)
);

insert into tq84_top_n  values (7, 'seven');
insert into tq84_top_n  values (9, 'nine' );
insert into tq84_top_n  values (5, 'five' );
insert into tq84_top_n  values (2, 'two'  );
insert into tq84_top_n  values (4, 'four' );
insert into tq84_top_n  values (8, 'eight');
insert into tq84_top_n  values (1, 'one'  );
insert into tq84_top_n  values (6, 'six'  );
insert into tq84_top_n  values (3, 'three');


select
  id, txt
from
  tq84_top_n
order by id
  offset      2 rows
  fetch first 4 rows only;

drop table tq84_top_n purge;
