create table tq84_first_value (
   a number  (2),
   b varchar2(2)
);

insert into tq84_first_value values (1, 'B');
insert into tq84_first_value values (2, 'C');
insert into tq84_first_value values (3, 'A');
insert into tq84_first_value values (4, 'E');
insert into tq84_first_value values (5, 'D');

select
   a,
   b,
   first_value(a   ) over (order by b) first_a , -- 3 (A is first)
   nth_value  (a, 1) over (order by b) first_a_, -- Same as above, but using nth_value
   first_value(b   ) over (order by a) first_b , -- B (1 is first)
   nth_value  (b, 1) over (order by a) first_b_  -- Same as above, but using nth_value
from
   tq84_first_value;
--
-- 
--   A B  FIRST_A FIRST_A_ FI FI
-- --- -- ------- -------- -- --
--   1 B        3        3 B  B 
--   2 C        3        3 B  B 
--   3 A        3        3 B  B 
--   4 E        3        3 B  B 
--   5 D        3        3 B  B 

drop table tq84_first_value purge;
