drop table tq84_log_table purge;

create table tq84_log_table (
   txt     varchar2(200)     not null,
   id      number(10)        generated by default on null as identity primary key,
   ts      timestamp         default systimestamp
);
