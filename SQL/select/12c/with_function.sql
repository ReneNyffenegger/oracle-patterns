create table tq84_with_function (
  id  number,
  txt varchar2(10)
);

insert into tq84_with_function values (1, 'one');
insert into tq84_with_function values (2, 'two');

with function dup (txt in varchar2) return varchar2 as
begin
  return txt || '-' || txt;
end dup;
select
  id,
  substr(dup(txt), 1, 40) dup
from
  tq84_with_function
/

drop table tq84_with_function;

