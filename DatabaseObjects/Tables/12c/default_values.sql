create sequence tq84_seq;

create table tq84_tab (
   id  number default tq84_seq.nextval not null,
   txt varchar2(10)
);

insert into tq84_tab      values (999999, 'foo');
insert into tq84_tab      values (  null, 'bar');

/* cannot insert NULL into (...."TQ84_TAB"."ID") */
insert into tq84_tab(txt) values (        'baz');


select * from tq84_tab;

drop table    tq84_tab purge;
drop sequence tq84_seq;
