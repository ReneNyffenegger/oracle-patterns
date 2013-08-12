create table tq84_src (
  a   number primary key,
  b   varchar2(10)
);

insert into tq84_src values ( 1, 'one'    );
insert into tq84_src values ( 2, 'two'    );
insert into tq84_src values ( 3, 'three'  );
insert into tq84_src values ( 4, 'four'   );
insert into tq84_src values (11, 'eleven' );

create table tq84_dest (
  a   number,
  b   varchar2(10)
);


create materialized view tq84_dest
  on prebuilt table
  refresh complete on commit
as
  select a, b from tq84_src where a <= 10
;

--  Note: empty after creating:

select * from tq84_dest;

insert into tq84_src values ( 5, 'five'   );
insert into tq84_src values (15, 'fifteen');

commit;

-- All wexpected values found after commiting:

select * from tq84_dest;

drop materialized view tq84_dest;
drop table             tq84_dest purge;
drop table             tq84_src  purge;
