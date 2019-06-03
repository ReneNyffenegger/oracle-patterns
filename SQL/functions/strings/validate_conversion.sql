create table tq84_some_strings (
  str varchar2(20)
);

insert into tq84_some_strings values ('42'                 );
insert into tq84_some_strings values ( '42.42'             );
insert into tq84_some_strings values ('-42.42'             );
insert into tq84_some_strings values ('    42    '         );
insert into tq84_some_strings values ('    42.42 '         );
insert into tq84_some_strings values ('42xyz'              );
insert into tq84_some_strings values ('2019-05-18'         );
insert into tq84_some_strings values ('2019-05-18 13:08:05');
insert into tq84_some_strings values ('Hello, world.'      );


select
   str,
   case when validate_conversion(str as number                                ) = 1 then 'number'         end is_number,
   case when validate_conversion(str as binary_double                         ) = 1 then 'binary_double'  end is_float,
   case when validate_conversion(str as date         , 'yyyy-mm-dd'           ) = 1 then 'date'           end is_date,
   case when validate_conversion(str as date         , 'yyyy-mm-dd hh24:mi:ss') = 1 then 'date-time'      end is_date_time
from
   tq84_some_strings;
--
-- STR                  IS_NUM IS_FLOAT      IS_D IS_DATE_T
-- -------------------- ------ ------------- ---- ---------
-- 42                   number binary_double
-- 42.42                number binary_double
-- -42.42               number binary_double
--     42               number binary_double
--     42.42            number binary_double
-- 42xyz
-- 2019-05-18                                date date-time
-- 2019-05-18 13:08:05                            date-time
-- Hello, world.
--

drop table tq84_some_strings purge;
exit
