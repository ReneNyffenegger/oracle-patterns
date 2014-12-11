create table tq84_autoincrement (
  id   number primary key,
  txt  varchar2(20)
);


create sequence tq84_autoincrement_seq;


create or replace trigger tq84_autoincrement_ins
  before insert on tq84_autoincrement
  for each row
  when (new.id is null)

begin

  select tq84_autoincrement_seq.nextval into :new.id from dual;

end;
/

insert into tq84_autoincrement (txt) values ('one');
insert into tq84_autoincrement (txt) values ('two');

insert into tq84_autoincrement (id, txt) values (100, 'hundred');

select * from tq84_autoincrement;


drop table tq84_autoincrement purge;
drop sequence tq84_autoincrement_seq;
