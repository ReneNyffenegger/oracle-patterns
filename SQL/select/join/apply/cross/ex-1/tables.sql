create table tq84_left (
   id    integer primary key,
   text  varchar2(3) not null
);

create table tq84_right (
   id_left  integer not null references tq84_left,
   val      number(5,2)
);
