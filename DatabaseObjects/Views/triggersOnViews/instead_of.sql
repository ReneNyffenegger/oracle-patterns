create table tq84_parent (
  id   number        primary key,
  txt  varchar2(10)  unique
);

create table tq84_child (
  id   number primary key,
  id_p number references tq84_parent,
  txt  varchar2(10),
  unique (id_p, txt)
);

create sequence tq84_parent_seq;
create sequence tq84_child_seq ;

insert into tq84_parent values (tq84_parent_seq.nextval, 'one');
insert into tq84_child  values (tq84_child_seq.nextval ,  tq84_parent_seq.currval, 'foo');
insert into tq84_child  values (tq84_child_seq.nextval ,  tq84_parent_seq.currval, 'bar');
insert into tq84_child  values (tq84_child_seq.nextval ,  tq84_parent_seq.currval, 'baz');

insert into tq84_parent values (tq84_parent_seq.nextval, 'two');

insert into tq84_parent values (tq84_parent_seq.nextval, 'three');
insert into tq84_child  values (tq84_child_seq.nextval ,  tq84_parent_seq.currval, 'apple' );
insert into tq84_child  values (tq84_child_seq.nextval ,  tq84_parent_seq.currval, 'banana');

insert into tq84_parent values (tq84_parent_seq.nextval, 'four');
insert into tq84_child  values (tq84_child_seq.nextval ,  tq84_parent_seq.currval, 'banana');

create view tq84_parent_child_view as
select
  p.txt   txt_parent,
  c.txt   txt_child
from
  tq84_parent   p  left join
  tq84_child    c  on p.id = c.id_p;

select * from tq84_parent_child_view;

--
-- ORA-01779: cannot modify a column which maps to a non key-preserved table
--
-- update tq84_parent_child_view set txt_child  = 'lemon' where txt_child  = 'banana';
-- update tq84_parent_child_view set txt_parent = 'dos'   where txt_parent = 'two';

create trigger tq84_parent_child_view_trg
  instead of update on tq84_parent_child_view
  for each row
declare

  id_parent number;
  id_child  number;

begin

  select id into id_parent from tq84_parent where nvl(txt, :old.txt_parent) = :old.txt_parent;
  begin
    select id into id_child  from tq84_child  where nvl(txt, :old.txt_child ) = :old.txt_child   and id_p = id_parent;
  exception when no_data_found then
    update tq84_parent set txt = :new.txt_parent where id = id_parent;
    insert into tq84_child values (tq84_child_seq.nextval, id_parent, :new.txt_child);
    return;
  end;

  update tq84_parent set txt = :new.txt_parent where id = id_parent;
  update tq84_child  set txt = :new.txt_child  where id = id_child  and id_p = id_parent;

end tq84_parent_child_view_trg;
/
show errors

update tq84_parent_child_view set txt_child = 'lemon'  where txt_child  = 'banana';
update tq84_parent_child_view set txt_child = 'pear'   where txt_child  = 'lemon'  and txt_parent = 'four';
update tq84_parent_child_view set txt_child = 'ananas' where txt_parent = 'two';

select * from tq84_parent_child_view;

drop sequence tq84_parent_seq;
drop sequence tq84_child_seq ;

drop view  tq84_parent_child_view;
drop table tq84_child       purge;
drop table tq84_parent      purge;
