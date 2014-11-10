create table tq84_regexp_replace (
  col_1    varchar2(10)
);

insert into tq84_regexp_replace values ('A204#904');
insert into tq84_regexp_replace values ('B92d9390');
insert into tq84_regexp_replace values ('A501abcd');


column digits   format a30
column alnums   format a30

select
  col_1,
  regexp_replace(col_1, 'A(\d*).*','\1') digits,
  regexp_replace(col_1, 'A(\w*).*','\1') alnums
from
  tq84_regexp_replace;


-- COL_1      DIGITS                         ALNUMS
-- ---------- ------------------------------ ------------------------------
-- A204#904   204                            204
-- B92d9390   B92d9390                       B92d9390
-- A501abcd   501                            501abcd

drop table tq84_regexp_replace purge;



declare

  m varchar2(200) := q'!foo
bar
baz
  !';

begin

  -- Use the modifier n to match newlines, too:
  dbms_output.put_line(regexp_replace(m, '....(...)....', '\1', modifier => 'n'));

end;
/
