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
insert into tq84_table values ( 9, 'nine' );
insert into tq84_table values (10, 'ten'  );
insert into tq84_table values ( 5, 'five' );


select
  id,
  txt
from
  tq84_table
order by
  id
offset     4 rows       -- skip first 4 records
fetch next 3 rows only  -- fetch next 3 records
;
--
--         ID TXT
-- ---------- ----------
--          5 five
--          6 six
--          7 seven

drop table tq84_table purge;
