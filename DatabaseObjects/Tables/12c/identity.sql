create table tq84_identity (
  id   number generated as identity primary key,
  txt  varchar2(10)
);


insert into tq84_identity(txt) values ('one'  );
insert into tq84_identity(txt) values ('two'  );
insert into tq84_identity(txt) values ('three');

select * from tq84_identity;

drop table tq84_identity purge;
