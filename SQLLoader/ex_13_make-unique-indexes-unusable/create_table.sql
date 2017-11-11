create table tq84_tab_with_pk (
  id  number,
  txt varchar2(10),
  --
  constraint tq84_tab_pk primary key (id)
);

insert into tq84_tab_with_pk values (1, 'foo');
insert into tq84_tab_with_pk values (2, 'bar');
insert into tq84_tab_with_pk values (3, 'baz');

commit;
