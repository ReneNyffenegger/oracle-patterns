create table tq84_regexp_substr (
   col_1  varchar2(30)
);

insert into tq84_regexp_substr values ('abc;def;ghi;klm');

-- Extract the third value
select       regexp_substr(col_1, '[^;]+[^;]', 1, 3)       from tq84_regexp_substr;

select rtrim(regexp_substr(col_1, '.*?;'     , 1, 3), ';') from tq84_regexp_substr;

drop table tq84_regexp_substr purge;
