create table tq84_lost_trigger_table (
       id number      primary key,
       b  varchar2(10),
       c  varchar2(10)
);

create view tq84_lost_trigger_view as
  select * from tq84_lost_trigger_table
  where b = 'foo';

-- insert into tq84_lost_trigger_table values (1, 'foo', 'FOO');
-- insert into tq84_lost_trigger_table values (2, 'foo', 'BAR');
-- insert into tq84_lost_trigger_table values (3, 'foo', 'BAZ');
-- 
-- insert into tq84_lost_trigger_table values (4, 'abc', 'ABC');
-- insert into tq84_lost_trigger_table values (5, 'abc', 'DEF');
-- insert into tq84_lost_trigger_table values (6, 'abc', 'GHI');

create trigger tq84_lost_trigger_trg

  instead of update on tq84_lost_trigger_view
  for each row

begin

    update tq84_lost_trigger_table 
       set b='foo',
           c=:new.c
     where id = :new.id;

end tq84_lost_trigger_trg;
/

-- update tq84_lost_trigger_view set b = b || b, c = c || c;


prompt Trigger exists:
select trigger_name from user_triggers where table_name = 'TQ84_LOST_TRIGGER_TABLE';

--    +---------------------------------------------+
--    |                                             | 
--    |    CREATE OR REPLACE the same view makes    |
--    |    the trigger GO!                          |
--    |                                             | 
--    +---------------------------------------------+

create or replace view tq84_lost_trigger_view as
  select * from tq84_lost_trigger_table
  where b = 'foo';

prompt Trigger gone:
select trigger_name from user_triggers where table_name = 'TQ84_LOST_TRIGGER_TABLE';

-------------------------------------------------------

drop view tq84_lost_trigger_view;
drop table tq84_lost_trigger_table purge;

