create table tq84_regexp_count (
  txt varchar2(30)
);

create table tq84_regular_expressions (
  re  varchar2(10)
);

insert into tq84_regexp_count values ('Hello World');
insert into tq84_regexp_count values ('GBP 17.30 and USD 18.25');

insert into tq84_regular_expressions values ('o'  );
insert into tq84_regular_expressions values ('.'  );
insert into tq84_regular_expressions values ('\.' );
insert into tq84_regular_expressions values ('\d' );
insert into tq84_regular_expressions values ('\d+');

select txt, re, regexp_count(txt, re) cnt
  from tq84_regexp_count, tq84_regular_expressions;


drop table tq84_regular_expressions;
drop table tq84_regexp_count purge;
