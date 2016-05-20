-- See clob_from_varchar2.sql

set verify   off
set define   off
set feedback off


create table tq84_varchar2 (
   i number primary key,
   v varchar2(100)
);

begin

  for i in 1 .. 100000 loop

      insert into tq84_varchar2 values (i, dbms_random.string('a', 100));

  end loop;

end;
/

create table tq84_clob (
  i number primary key,
  c clob
);


declare
  c_ clob;
begin
  insert into tq84_clob values (1, empty_clob()) returning c into c_;

  for r in (select v from tq84_varchar2 order by i) loop

      dbms_lob.append(c_, r.v);

  end loop;

end;
/
commit;

--drop table tq84_varchar2;
