create type tq84_some_type as object (
  a number,
  b number
);
/

create type tq84_some_table as table of tq84_some_type;
/



create or replace type tq84_some_type force as object (
   a varchar2(10),
   b number
);
/


select status from user_objects where object_name = 'TQ84_SOME_TABLE';

declare
   a tq84_some_table := tq84_some_table();
begin

   a.extend;
   a(a.count) := tq84_some_type('foo', 1);
end;
/

select status from user_objects where object_name = 'TQ84_SOME_TABLE';

drop type tq84_some_table;
drop type tq84_some_type;
