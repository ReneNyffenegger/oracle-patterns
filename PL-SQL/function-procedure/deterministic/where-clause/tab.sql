create table tq84_tab (
   id number,
   tx varchar2(10)
);

insert into tq84_tab values (1, 'one');
insert into tq84_tab values (2, 'two');
insert into tq84_tab values (3, 'three');

commit;
