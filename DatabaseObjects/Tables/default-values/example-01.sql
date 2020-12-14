create sequence tq84_seq start with 1 increment by 1;

create table tq84_tab (
--                     clause           expression
-- ----- ------------  ---------------  ----------------  -----------
   id    number        default          tq84_seq.nextval  primary key,
   txt_1 varchar2(10)                                     not null,
   txt_2 varchar2(10)  default on null 'n/a'              not null
);

insert into tq84_tab (txt_1, txt_2) values ('one', 'foo');
insert into tq84_tab (txt_1, txt_2) values ('two', 'bar');
insert into tq84_tab (txt_1       ) values ('three');

select * from tq84_tab;
-- 
--         ID TXT_1      TXT_2
-- ---------- ---------- ----------
--          1 one        foo
--          2 two        bar
--          3 three      n/a

drop table    tq84_tab;
drop sequence tq84_seq;
