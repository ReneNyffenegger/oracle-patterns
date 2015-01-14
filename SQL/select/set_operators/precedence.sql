create table tq84_a(val number);
create table tq84_b(val number);
create table tq84_c(val number);
create table tq84_d(val number);

insert into tq84_a values (1);
insert into tq84_a values (2);
insert into tq84_a values (9);

insert into tq84_b values (3);
insert into tq84_b values (4);
insert into tq84_b values (5);
insert into tq84_b values (7);
insert into tq84_a values (6);

insert into tq84_c values (1);
insert into tq84_c values (3);
insert into tq84_c values (5);
insert into tq84_a values (7);

insert into tq84_d values (2);
insert into tq84_d values (4);
insert into tq84_a values (0);

--
--     All set operators have equal precedence,
--     the following select statements are equivalent:
--

select val from tq84_a union
select val from tq84_b minus
select val from tq84_c union
select val from tq84_d;


(((select val from tq84_a   union
   select val from tq84_b)  minus
   select val from tq84_c)  union
   select val from tq84_d) ;

--       This is different...

  (select val from tq84_a  union
  (select val from tq84_b  minus
  (select val from tq84_c  union
   select val from tq84_d))) ;

--       As well as this:

  (select val from tq84_a  union
   select val from tq84_b) minus
  (select val from tq84_c  union
   select val from tq84_d);

--       As well as this:

   select val from tq84_a  union
  (select val from tq84_b  minus
   select val from tq84_c) union
   select val from tq84_d;


drop table tq84_a purge;
drop table tq84_b purge;
drop table tq84_c purge;
drop table tq84_d purge;
