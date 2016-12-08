--
-- Row limiting clause
--

create table tq84_fetch_some_rows (
  id  number,
  txt varchar2(10)
);

-- Note the duplicate of record id = 3
insert into tq84_fetch_some_rows values (5, 'five'   );
insert into tq84_fetch_some_rows values (3, 'three'  );
insert into tq84_fetch_some_rows values (7, 'seven'  );
insert into tq84_fetch_some_rows values (3, 'THREE'  );
insert into tq84_fetch_some_rows values (9, 'nine'   );
insert into tq84_fetch_some_rows values (8, 'eight'  );
insert into tq84_fetch_some_rows values (2, 'two'    );
insert into tq84_fetch_some_rows values (1, 'one'    );
insert into tq84_fetch_some_rows values (4, 'four'   );
insert into tq84_fetch_some_rows values (6, 'six'    );

select * from tq84_fetch_some_rows order by id fetch first   row  only;
-- 
--         ID TXT
-- ---------- ----------
--          1 one

-- Note how »rows« can be used instead of »row«
select * from tq84_fetch_some_rows order by id fetch first 3 rows only;
-- 
--         ID TXT
-- ---------- ----------
--          1 one
--          2 two
--          3 three

-- »only« vs »with ties«
select * from tq84_fetch_some_rows order by id fetch first 3 rows with ties;
-- 
--         ID TXT
-- ---------- ----------
--          1 one
--          2 two
--          3 three
--          3 THREE

-- change start with »offset«
select * from tq84_fetch_some_rows order by id offset 4 rows fetch next 2 rows only;
-- 
--         ID TXT
-- ---------- ----------
--          4 four
--          5 five

-- Select a certain percentage of rows;
select * from tq84_fetch_some_rows order by id fetch first 30 percent rows only;
-- 
--         ID TXT
-- ---------- ----------
--          1 one
--          2 two
--          3 three

drop table tq84_fetch_some_rows purge;
