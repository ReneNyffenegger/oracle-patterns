create table tq84_queue (
  item    number(7) primary key,
  status  varchar2(4) not null check (status in ('TODO', 'DONE'))
);
