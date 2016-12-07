create table tq84_break (
  col_1  number,
  col_2  varchar2(12)
);

insert into tq84_break values (238, 'foo'        );
insert into tq84_break values (238, 'bar'        );
insert into tq84_break values (  4, 'quattro'    );
insert into tq84_break values (  8, 'hello'      );
insert into tq84_break values (238, 'baz'        );
insert into tq84_break values (  8, 'world'      );
insert into tq84_break values (42, 'The number!');
insert into tq84_break values (  8, 'world'      );
insert into tq84_break values (  4, 'four'       );

break on col_1 skip 1

select
  col_1,
  col_2
from
  tq84_break
order by
  col_1;
-- 
--      COL_1 COL_2
-- ---------- ------------
--          4 quattro
--            four
-- 
--          8 world
--            hello
--            world
-- 
--         42 The number!
-- 
--        238 bar
--            foo
--            baz

drop table tq84_break purge;
