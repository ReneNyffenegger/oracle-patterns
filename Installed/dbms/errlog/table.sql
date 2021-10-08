create table tq84_src (
   id   number(2),
   txt  varchar2(20) not null,
   num  number
);

create table tq84_dest (
   id   number(2),
   txt  varchar2(20) not null,
   num  number,
   constraint tq84_err_log_pk primary key(id)
);
