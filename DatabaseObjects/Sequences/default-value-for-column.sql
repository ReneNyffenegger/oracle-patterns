create sequence tq84_seq start with 1 increment by 1;

create table tq84_tab (
  id  number default tq84_seq.nextval primary key,
  txt varchar2(10)
);

insert into tq84_tab (txt) values ('foo');
insert into tq84_tab (txt) values ('bar');
insert into tq84_tab (txt) values ('baz');

select * from tq84_tab;
-- 
--         ID TXT
-- ---------- ----------
--          1 foo
--          2 bar
--          3 baz


drop table    tq84_tab purge;
drop sequence tq84_seq;
