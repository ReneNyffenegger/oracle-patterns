create table tq84_table (
   id     number,
   txt    varchar2(10)
);

insert into tq84_table values ( 2, 'two'  );
insert into tq84_table values ( 1, 'one'  );
insert into tq84_table values ( 6, 'six'  );
insert into tq84_table values ( 8, 'eight');
insert into tq84_table values ( 3, 'three');
insert into tq84_table values ( 7, 'seven');
insert into tq84_table values ( 4, 'four' );
insert into tq84_table values ( 0, 'zero' );
insert into tq84_table values ( 9, 'nine' );
insert into tq84_table values (10, 'ten'  );
insert into tq84_table values ( 5, 'five' );

commit;


select
  id,
  txt
from
  tq84_table
order by
  id
fetch first row only;
--
--          ID TXT
--  ---------- ----------
--           0 zero

select
  id,
  txt
from
  tq84_table
order by
  id desc
fetch first 3 rows only;

--
--         ID TXT
-- ---------- ----------
--         10 ten
--          9 nine
--          8 eight


drop table tq84_table purge;
