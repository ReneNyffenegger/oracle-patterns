--
--     Mostly the same thing as «on_prebuilt_table.sql», but with an
--     index organized table.
--

create table tq84_src (
  a   number primary key,
  b   varchar2(10)
);

insert into tq84_src values ( 1, 'one'    );
insert into tq84_src values ( 2, 'two'    );
insert into tq84_src values ( 3, 'three'  );
insert into tq84_src values ( 4, 'four'   );
insert into tq84_src values (11, 'eleven' );

create table tq84_dest_iot (
  a   number primary key,
  b   varchar2(10)
)
organization index;


create materialized view tq84_dest_iot
  on prebuilt table
  refresh complete on commit
as
  select a, b from tq84_src where a <= 10
;

--  Note: empty after creating:

select * from tq84_dest_iot;

insert into tq84_src values ( 5, 'five'   );
insert into tq84_src values (15, 'fifteen');

commit;

-- All wexpected values found after commiting:

select * from tq84_dest_iot;

drop materialized view tq84_dest_iot;
drop table             tq84_dest_iot purge;
drop table             tq84_src      purge;
