create table tq84_nth_value (
  part varchar2(3),
  i    number,
  a    varchar2(10)
);

insert into tq84_nth_value values ('bar',  1, 'one'       );
insert into tq84_nth_value values ('bar',  5, 'five'      );
insert into tq84_nth_value values ('bar',  8, 'eight'     );
insert into tq84_nth_value values ('bar',  9, 'nine'      );
insert into tq84_nth_value values ('bar', 11, 'eleven'    );
insert into tq84_nth_value values ('bar', 13, 'thirteen'  );

insert into tq84_nth_value values ('baz',  2, 'two'       );
insert into tq84_nth_value values ('baz',  3, 'three'     );
insert into tq84_nth_value values ('baz',  4, 'four'      );

insert into tq84_nth_value values ('foo',  7, 'seven'     );
insert into tq84_nth_value values ('foo', 12, 'twelve'    );
insert into tq84_nth_value values ('foo', 14, 'fourteen'  );
insert into tq84_nth_value values ('foo', 20, 'twenty'    );
insert into tq84_nth_value values ('foo', 21, 'twenty-one');
insert into tq84_nth_value values ('foo', 22, 'twenty-two');

select
  part,
  i
  a,
  nth_value(a, 3) from first over (partition by part order by i                                                          ) p,
  nth_value(a, 3) from first over (partition by part order by i range between unbounded preceding and unbounded following) q,
  nth_value(a, 3) from last  over (partition by part order by i                                                          ) r,
  nth_value(a, 3) from last  over (partition by part order by i range between unbounded preceding and unbounded following) t
from
  tq84_nth_value;

drop table tq84_nth_value purge;
