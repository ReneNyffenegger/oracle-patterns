drop table someData purge;

create table someData (
   id    varchar2(5)   primary key,
   num   number,
   txt   varchar2(20)
);

insert into someData values ('foo', 42, 'twenty-four');
insert into someData values ('bar', 99, 'ninety-nine');
insert into someData values ('baz', -2, 'minus two'  );

commit;
