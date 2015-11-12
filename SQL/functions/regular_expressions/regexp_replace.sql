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


-----------------------------------------------------------------------------
--
--    Select first four words of a string.
--   (http://stackoverflow.com/a/30621140/180275)


select
   regexp_replace(
     'Hello    world   this   is a   test     etc',
     '(((\w+)\s+){4}).*',  -- Change 4 to wanted number of words here!
     '\1'
   )
   from dual;


-----------------------------------------------------------------------------
--
--  Replace initcap()'ped canton abbreviations with correct upper case abbreviation:
--    Ag -> AG, Ur -> UR, Zh -> ZH etc


select 
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(
  regexp_replace(c, 
     'Zh($|\s)', 'ZH\1'), -- Zürich
     'Be($|\s)', 'BE\1'), -- Bern
     'Lu($|\s)', 'LU\1'), -- Luzern
     'Ur($|\s)', 'UR\1'), -- Uri
     'Sz($|\s)', 'SZ\1'), -- Schwyz
     'Ow($|\s)', 'OW\1'), -- Obwalden
     'Nw($|\s)', 'NW\1'), -- Nidwalden
     'Gl($|\s)', 'GL\1'), -- Glarus
     'Zg($|\s)', 'ZG\1'), -- Zug
     'Fr($|\s)', 'FR\1'), -- Freiburg
     'So($|\s)', 'SO\1'), -- Solothurn
     'Bs($|\s)', 'BS\1'), -- Basel-Stadt
     'Bl($|\s)', 'BL\1'), -- Basel-Landschaft
     'Sh($|\s)', 'SH\1'), -- Schaffhausen
     'Ar($|\s)', 'AR\1'), -- Appenzell A. Rh.
     'Ai($|\s)', 'AI\1'), -- Appenzell I. Rh.
     'Sg($|\s)', 'SG\1'), -- St. Gallen
     'Gr($|\s)', 'GR\1'), -- Graubünden
     'Ag($|\s)', 'AG\1'), -- Aargau
     'Tg($|\s)', 'TG\1'), -- Thurgau
     'Ti($|\s)', 'TI\1'), -- Tessin
     'Vd($|\s)', 'VD\1'), -- Waadt
     'Vs($|\s)', 'VS\1'), -- Wallis
     'Ne($|\s)', 'NE\1'), -- Neuenburg
     'Ge($|\s)', 'GE\1'), -- Genf
     'Ju($|\s)', 'JU\1')  -- Jura
    r
from (
  select 'Foo Ag'     c from dual union all
  select 'Bar Zh Baz' c from dual union all
  select 'Moo Ur 1'   c from dual
);   
