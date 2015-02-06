-- https://github.com/ReneNyffenegger/oracle_scriptlets/blob/master/sqlpath/drop_schema_if_exists.sql
@drop_schema_if_exists tq84_user

create user tq84_user
  identified by p
  quota unlimited on users;

grant create procedure,
      create table,
      create session,
      create view
   to tq84_user;

grant read,write on directory DATAPUMP_DIR to tq84_user;

connect tq84_user/p

create table  table_parent (
  id    number primary key,
  col_1 number not null,
  col_2 varchar2(20),
  col_3 date
);

create table table_child (
  id        number primary key,
  id_parent references table_parent,
  col_1     number not null,
  col_2     varchar2(20)
);

create package package_1 as
  function f return number;
end package_1;
/

create package body package_1 as 
  function f return number is begin
    return 42;
  end f;
end package_1;
/

create view view_01 as select
  p.col_1   p_col_1,
  p.col_2   p_col_2,
  p.col_3   p_col_3,
  c.col_1   c_col_1,
  c.col_2   c_col_2
from
  table_parent p  left join
  table_child  c  on p.id = c.id_parent;

insert into table_parent values (1, 20, 'foo', null        );
insert into table_parent values (2, 40, 'bar', sysdate     );
insert into table_parent values (3, 60, 'baz', sysdate-20/3);

insert into table_child values  (1, 1, 0.2, 'apple');
insert into table_child values  (2, 1, 0.3, 'pear' );
insert into table_child values  (3, 1, 0.5, 'lemon');

insert into table_child values  (4, 3, 1  , 'New York');
