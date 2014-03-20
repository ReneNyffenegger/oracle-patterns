create table tq84_identity (
  id   number generated as identity start with 10 increment by 3 primary key,
  txt  varchar2(10)
);


insert into tq84_identity(txt) values ('ten'     );
insert into tq84_identity(txt) values ('thirteen');
insert into tq84_identity(txt) values ('sixtenn' );

select * from tq84_identity;

drop table tq84_identity purge;
