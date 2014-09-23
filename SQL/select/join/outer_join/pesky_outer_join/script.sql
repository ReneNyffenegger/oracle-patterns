create table A (i number(1) primary key);
create table Z (i char  (1) primary key);

create table A2Z (
  ia          not null references A,
  flg char(1)     null,
  iz  char(1)     null
);

insert into A values (1);
insert into A values (2);
insert into A values (3);
insert into A values (4);
insert into A values (5);
insert into A values (6);
insert into A values (7);

insert into Z values ('a');
insert into Z values ('b');
insert into Z values ('c');
insert into Z values ('d');

insert into A2Z values (1, 'y', 'a' );
insert into A2Z values (1, 'n', 'b' );
insert into A2Z values (2,null, 'c' );
insert into A2Z values (2, 'q', 'd' );
insert into A2Z values (3, 'y', 'e' );
insert into A2Z values (4,null, 'f' );
insert into A2Z values (5, 'y', null);
insert into A2Z values (6, 'v', null);

select
  A.i  a_i,
  Z.i  z_i
from
  A, A2Z, Z
where
  A.i         = A2Z.ia (+) and
  A2Z.flg (+) = 'y'        and
  A2Z.iz      = Z.i    (+)
order by
  A.i;


drop table A2Z purge;
drop table   Z purge;
drop table A   purge;
