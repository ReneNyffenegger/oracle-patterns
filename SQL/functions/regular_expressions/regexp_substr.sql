select regexp_substr('foo3245bar', '\d+') from dual; -- > 3245

create table tq84_regexp_substr (
   col_1  varchar2(30)
);

insert into tq84_regexp_substr values ('abc;def;ghi;klm');

-- Extract the third value
select       regexp_substr(col_1, '[^;]+[^;]', 1, 3)       third from tq84_regexp_substr;

select rtrim(regexp_substr(col_1, '.*?;'     , 1, 3), ';') third from tq84_regexp_substr;

drop table tq84_regexp_substr purge;

--

declare

  -- Get «word» between > and <

  str  varchar2(100) := 'foo bar >words and such< baz';

begin

   dbms_output.put_line(regexp_substr(
    
      str,
     '[^><]+',
      1,
      2

   ));

end;
/
