create table tq84_nls_numeric_characters (
  id   varchar2(10),
  num  number
);


alter session set nls_numeric_characters = '.,';

insert into tq84_nls_numeric_characters values ('a', '11.11');

-- ORA-01722: invalid number
-- insert into tq84_nls_numeric_characters values ('b', '22,22');

alter session set nls_numeric_characters = ',.';

-- ORA-01722: invalid number
-- insert into tq84_nls_numeric_characters values ('a', '22.22');
insert into tq84_nls_numeric_characters values ('a', '22,22');

select * from tq84_nls_numeric_characters;
-- ID                NUM
-- ---------- ----------
-- a               11,11
-- a               22,22

alter session set nls_numeric_characters = '.,';
select * from tq84_nls_numeric_characters;
-- ID                NUM
-- ---------- ----------
-- a               11.11
-- a               22.22



drop table tq84_nls_numeric_characters purge;
