create table tq84_t (
  id      number,
  word    varchar2(10)
);


insert into tq84_t values ( 1, 'abc');

insert into tq84_t values ( 2, 'def');
insert into tq84_t values ( 3, 'def');

insert into tq84_t values ( 4, 'ghi');

insert into tq84_t values ( 5, 'jkl');
insert into tq84_t values ( 6, 'jkl');
insert into tq84_t values ( 7, 'jkl');

insert into tq84_t values ( 8, 'mno');

insert into tq84_t values ( 9, 'pqr');
insert into tq84_t values (10, 'pqr');
insert into tq84_t values (11, 'pqr');
insert into tq84_t values (12, 'pqr');

insert into tq84_t values (13, 'stu');

insert into tq84_t values (14, 'vwx');
insert into tq84_t values (15, 'vwx');
insert into tq84_t values (16, 'vwx');

insert into tq84_t values (17, 'yz.');


select *
from
  tq84_t
match_recognize (
  order by
    id
  measures
    first(rec.id)  as start_id,
    rec.id         as end_id,
    match_number() as match_counter
  pattern (
    rec{3}
  )
  define   
    rec as rec.word = first(rec.word)
)
order by
  start_id;
-- 
--   START_ID     END_ID MATCH_COUNTER
-- ---------- ---------- -------------
--          5          7             1
--          9         11             2
--         14         16             3

drop table tq84_t purge;
