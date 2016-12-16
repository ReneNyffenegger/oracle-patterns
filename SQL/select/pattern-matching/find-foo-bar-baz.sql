--
-- Find record with 'foo' followed
-- by record with 'bar' foolowed by
-- record with 'baz'.
--

create table tq84_t (
  id      number,
  word    varchar2(10)
);


insert into tq84_t values ( 1, 'abc');
insert into tq84_t values ( 2, 'foo');
insert into tq84_t values ( 3, 'def');
insert into tq84_t values ( 4, 'bar');
insert into tq84_t values ( 5, 'baz');
insert into tq84_t values ( 6, 'ghi');
insert into tq84_t values ( 7, 'bar');
insert into tq84_t values ( 8, 'jkl');
insert into tq84_t values ( 9, 'foo');
insert into tq84_t values (10, 'bar');
insert into tq84_t values (11, 'baz');
insert into tq84_t values (12, 'baz');
insert into tq84_t values (13, 'mno');
insert into tq84_t values (14, 'pqr');
insert into tq84_t values (15, 'foo');
insert into tq84_t values (16, 'bar');
insert into tq84_t values (17, 'baz');
insert into tq84_t values (18, 'stu');
insert into tq84_t values (19, 'foo');
insert into tq84_t values (20, 'bar');
insert into tq84_t values (21, 'vwx');
insert into tq84_t values (22, 'baz');


select *
from
  tq84_t
match_recognize (
  order by
    id
  measures
    foo.id         as start_id,
    match_number() as match_counter
  pattern (
    foo bar baz
  )
  define   
    foo as foo.word = 'foo',
    bar as bar.word = 'bar',
    baz as baz.word = 'baz'
)
order by
  start_id;

drop table tq84_t purge;
