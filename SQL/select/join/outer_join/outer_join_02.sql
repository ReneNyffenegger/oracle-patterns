--
--
--         +-----+    +-----+    +-----+
--         |  A  +---<|  B  +---<|  C  |                                                                                                  l
--         +-----+    +--+--+    +-----+
--                       |
--                       ^
--                    +-----+
--                    |  D  |
--                    +-----+
--

create table tq84_a (a number primary key);
create table tq84_b (b number primary key references tq84_a);
create table tq84_c (c number references tq84_b);
create table tq84_d (d number references tq84_b);

insert into tq84_a values (1);
insert into tq84_a values (2);
insert into tq84_a values (3);
insert into tq84_a values (4);

insert into tq84_b values (2);
insert into tq84_b values (3);
insert into tq84_b values (4);

insert into tq84_c values (3);
insert into tq84_c values (4);

insert into tq84_d values (2);
insert into tq84_d values (3);


column a format  99
column b format  99
column c format  99
column d format  99

prompt
prompt  __________________  Without C:

select a,b,cast(null as number) c,d
  from tq84_a  a                        join
       tq84_b  b on b.b  =  a.a         join
       tq84_d  d on d.d  =  b.b;       

prompt
prompt  __________________  all tables, no left joins:

select a,b,c,d
  from tq84_a  a                        join
       tq84_b  b on b.b  =  a.a         join
       tq84_c  c on c.c  =  b.b         join
       tq84_d  d on d.d  =  b.b;       

prompt
prompt  __________________  all tables, left joining c:

select a,b,c,d
  from tq84_a  a                        join
       tq84_b  b on b.b  =  a.a    left join
       tq84_c  c on c.c  =  b.b         join
       tq84_d  d on d.d  =  b.b;

prompt


drop table tq84_d purge;
drop table tq84_c purge;
drop table tq84_b purge;
drop table tq84_a purge;
