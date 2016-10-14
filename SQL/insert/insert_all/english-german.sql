create table tq84_insert_all_dest_en (
  id    number,
  txt   varchar2(10)
);

create table tq84_insert_all_dest_de (
  id    number,
  txt   varchar2(10)
);

create table tq84_insert_all_src (
  id    number,
  en    varchar2(10),
  de    varchar2(10)
);

insert into tq84_insert_all_src values (1, 'one'  , 'eins');
insert into tq84_insert_all_src values (2, 'two'  , 'zwei');
insert into tq84_insert_all_src values (3, 'three', 'drei');
insert into tq84_insert_all_src values (4, 'four' , 'vier');
insert into tq84_insert_all_src values (5, 'five' , 'fünf');

insert all
  into tq84_insert_all_dest_en (id, txt) values (id, en)
  into tq84_insert_all_dest_de (id, txt) values (id, de)
select
  *
from tq84_insert_all_src;

select * from tq84_insert_all_dest_en;
--         ID TXT
-- ---------- ----------
--          1 one
--          2 two
--          3 three
--          4 four
--          5 five

select * from tq84_insert_all_dest_de;
--         ID TXT
-- ---------- ----------
--          1 eins
--          2 zwei
--          3 drei
--          4 vier
--          5 fünf

drop table tq84_insert_all_src     purge;
drop table tq84_insert_all_dest_en purge;
drop table tq84_insert_all_dest_de purge;
