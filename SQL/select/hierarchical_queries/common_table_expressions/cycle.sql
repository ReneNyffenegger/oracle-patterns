--
--  Prevent «ORA-32044: cycle detected while executing recursive WITH query»
--

create table tq84_cycle (
  me          varchar2(10),
  points_to   varchar2(10)
);


insert into tq84_cycle values ('ROOT'   ,  null );
insert into tq84_cycle values (  'foo'  , 'ROOT');
insert into tq84_cycle values (    '123', 'foo' );
insert into tq84_cycle values (    '456', 'foo' );
insert into tq84_cycle values (  'bar'  , 'ROOT');
insert into tq84_cycle values (    '789', 'bar' );
insert into tq84_cycle values (  'baz'  , 'ROOT');
insert into tq84_cycle values (    '000', 'baz' );

-- Troublemakers
insert into tq84_cycle values (  'bar'  , 'baz');
insert into tq84_cycle values (  'baz'  , 'bar');


with a (me, lvl) as (
    select
      me,
      0 lvl
    from 
      tq84_cycle 
    where 
      points_to is null
  union all
    select
      tq84_cycle.me,
      lvl + 1
    from 
      a join
      tq84_cycle on a.me = tq84_cycle.points_to
)
search depth first by me set column_name_for_ordering
cycle me set cycle_ to '1' default '0'
select
  lpad(' ', lvl) || me
--cycle_
from
  a;


drop table tq84_cycle purge;
