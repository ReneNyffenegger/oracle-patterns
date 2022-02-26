create table tq84_nth_value (
   i    number,
   a    varchar2(10)
);

insert into tq84_nth_value values (11, 'eleven'    );
insert into tq84_nth_value values ( 3, 'three'     );
insert into tq84_nth_value values (21, 'twenty-one');
insert into tq84_nth_value values ( 8, 'eight'     );
insert into tq84_nth_value values ( 9, 'nine'      );
insert into tq84_nth_value values (22, 'twenty-two');
insert into tq84_nth_value values (13, 'thirteen'  );
insert into tq84_nth_value values ( 4, 'four'      );
insert into tq84_nth_value values ( 1, 'one'       );
insert into tq84_nth_value values ( 7, 'seven'     );
insert into tq84_nth_value values (12, 'twelve'    );
insert into tq84_nth_value values ( 5, 'five'      );
insert into tq84_nth_value values (14, 'fourteen'  );
insert into tq84_nth_value values ( 2, 'two'       );
insert into tq84_nth_value values (20, 'twenty'    );

select
-- i,
   a,
   nth_value(a, 3) from first over (order by i                                                          ) p,
   nth_value(a, 3) from first over (order by i range between unbounded preceding and unbounded following) q,
   nth_value(a, 3) from first over (order by i range between 4         preceding and unbounded following) r,
   nth_value(a, 3) from last  over (order by i                                                          ) s,
   nth_value(a, 3) from last  over (order by i range between unbounded preceding and unbounded following) t
from
   tq84_nth_value;
--
-- A          P          Q          R          S          T
-- ---------- ---------- ---------- ---------- ---------- ----------
-- one                   three      three                 twenty
-- two                   three      three                 twenty
-- three      three      three      three      one        twenty
-- four       three      three      three      two        twenty
-- five       three      three      three      three      twenty
-- seven      three      three      five       four       twenty
-- eight      three      three      seven      five       twenty
-- nine       three      three      eight      seven      twenty
-- eleven     three      three      nine       eight      twenty
-- twelve     three      three      eleven     nine       twenty
-- thirteen   three      three      twelve     eleven     twenty
-- fourteen   three      three      thirteen   twelve     twenty
-- twenty     three      three      twenty-two thirteen   twenty
-- twenty-one three      three      twenty-two fourteen   twenty
-- twenty-two three      three      twenty-two twenty     twenty

drop table tq84_nth_value purge;
