create table tq84_oj_left (
   a  number,
   b  varchar2(10)
);

create table tq84_oj_right (
   c  number,
   d  varchar2(10)
);

insert into tq84_oj_left  values (1, 'one'  );
insert into tq84_oj_left  values (2, 'two'  );
insert into tq84_oj_left  values (3, 'three');
insert into tq84_oj_left  values (4, 'four' );

--

insert into tq84_oj_right values (1, 'foo');
insert into tq84_oj_right values (1, 'bar');
insert into tq84_oj_right values (1, 'baz');

insert into tq84_oj_right values (3, 'Paris');
insert into tq84_oj_right values (3, 'Berlin');
insert into tq84_oj_right values (3, 'London');

insert into tq84_oj_right values (4, 'London');

-------------------------------------------------------------
-- 
--     The «problem» with the following select statement is:
--     
--          No record for 'two' and 'four' are returned,
--          but we'd like to see them.
--          

select
  b,
  d
from
  tq84_oj_left   left join
  tq84_oj_right  on a = c
where
  d != 'London'
order by
  a;

-------------------------------------------------------------
--
--
--     If the condition d != 'London' is made part
--     of the «explicit» left join condition, then
--     we have at least a record returned for all records
--     of table TQ84_OJ_LEFT.

select
  b,
  d
from
  tq84_oj_left   left join
  tq84_oj_right  on a = c and
                    d!='London'
order by
  a;

drop table tq84_oj_left   purge;
drop table tq84_oj_right  purge;
