create table tq84_regexp_substr (
   col_1  varchar2(30)
);

insert into tq84_regexp_substr values ('abc;def;ghi;klm');

-- Extract the third value
select       regexp_substr(col_1, '[^;]+[^;]', 1, 3)       third from tq84_regexp_substr;
--
-- ghi

--
-- Same thing with alternative regexp
select rtrim(regexp_substr(col_1, '.*?;'     , 1, 3), ';') third from tq84_regexp_substr;
--
-- ghi

drop table tq84_regexp_substr purge;
