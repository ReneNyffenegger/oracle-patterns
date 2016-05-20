set verify off
set define off
set feedback off 

create table tq84_varchar2 (
  i number primary key,
  v varchar2(400)
);

insert into tq84_varchar2 values (1, 'foo');
insert into tq84_varchar2 values (2, 'bar baz');
insert into tq84_varchar2 values (3, 'more foo');
insert into tq84_varchar2 values (4, 'and so on');

commit;

create table tq84_table_with_clob (
  i number primary key,
  c clob
);

insert into tq84_table_with_clob values (1, empty_clob());

declare
  c_ clob;
begin

  select c into c_ from tq84_table_with_clob where i = 1 for update;

  for r in (select v from tq84_varchar2 order by i) loop
    dbms_lob.append(c_, r.v);
  end loop;

end;
/

commit;

select * from tq84_table_with_clob;


drop table tq84_varchar2;
drop table tq84_table_with_clob;
