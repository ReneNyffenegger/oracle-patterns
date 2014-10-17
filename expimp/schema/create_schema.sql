@drop_schema

create user just_a_schema
  identified by x
  quota unlimited on users;

grant
  create session,
  create table,
  create sequence,
  create trigger
to
  just_a_schema;

connect just_a_schema/x

create table a_tbl (
  id   number primary key,
  txt  varchar2(20)
);

create sequence a_seq;

create trigger a_trg
  before insert or update on a_tbl
  for each row
begin
  :new.id := a_seq.nextval;
end a_trg;
/

insert into a_tbl(txt) values ('record #1');
insert into a_tbl(txt) values ('record #2');
insert into a_tbl(txt) values ('record #3');

-- select * from a_tbl;

create table b_tbl (
  id_a  number not null references a_tbl,
  txt   varchar2(20)
);

insert into b_tbl values (1, 'foo');
insert into b_tbl values (1, 'bar');
insert into b_tbl values (1, 'baz');

insert into b_tbl values (2, 'hello');
insert into b_tbl values (2, 'world');

-- select * from b_tbl;

commit;
