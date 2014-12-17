create table tq84_word_boundaries (
  txt  varchar2(50)
);

insert into tq84_word_boundaries values ('AFooABarAndABaz'       );
insert into tq84_word_boundaries values ('A FooA BarAndABaz'     );
insert into tq84_word_boundaries values ('A Foo, a Bar and a Baz');
insert into tq84_word_boundaries values ('A Foo without a Baz'   );
insert into tq84_word_boundaries values ('Foo Bar, Baz'          );
insert into tq84_word_boundaries values ('Is it a Foo?'          );
insert into tq84_word_boundaries values ('Bar-Foo-Baz'           );

select * from tq84_word_boundaries
  where
    regexp_like(txt, '\bFoo\b');

-- No records returned, Oracle does not support \b (at least not on 11i)


select * from tq84_word_boundaries
  where
    regexp_like(txt, '\sFoo\s');

-- TXT
-- --------------------------------------------------
-- A Foo without a Baz


select * from tq84_word_boundaries
  where
    regexp_like(txt, '(^|\s)Foo($|\s)');


-- TXT
-- --------------------------------------------------
-- A Foo without a Baz
-- Foo Bar, Baz



select * from tq84_word_boundaries
  where
    regexp_like(txt, '(^|\s|\W)Foo($|\s|\W)');

-- TXT
-- --------------------------------------------------
-- A Foo, a Bar and a Baz
-- A Foo without a Baz
-- Foo Bar, Baz
-- Is it a Foo?
-- Bar-Foo-Baz



drop table tq84_word_boundaries purge;
