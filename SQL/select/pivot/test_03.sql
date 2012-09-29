-- «Better» Aliases for generated pivot columns.


create table tq84_pivot_03 (
  nm number,
  tx varchar2(2)
);

insert into tq84_pivot_03 values ( 1, '/?'   );
insert into tq84_pivot_03 values ( 3, '/?'   );

insert into tq84_pivot_03 values ( 7, '  '   );
insert into tq84_pivot_03 values ( 8, '  '   );
insert into tq84_pivot_03 values ( 2, '  '   );

insert into tq84_pivot_03 values (66, chr(10));
insert into tq84_pivot_03 values (59, chr(10));
insert into tq84_pivot_03 values (31, chr(10));

select "'/?'", "'  '", "'
'"
from tq84_pivot_03
  pivot (max(nm)  for tx in ('/?', '  ', '
'));


select 
  slash_question, 
  space_space, 
  new_line
from 
  tq84_pivot_03
pivot (max(nm)  for tx in (
  '/?' as slash_question, 
  '  ' as space_space, '
'      as new_line
  )
);

drop table tq84_pivot_03 purge;
