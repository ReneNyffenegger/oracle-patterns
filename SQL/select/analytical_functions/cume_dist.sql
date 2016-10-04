create table tq84_cume (
  num number
);

insert into tq84_cume values ( 1);
insert into tq84_cume values ( 2);
insert into tq84_cume values ( 2);
insert into tq84_cume values ( 9);
insert into tq84_cume values (10);


select
    num,
    cume_dist   () over (order by num)                               cume_dst,
   (rank        () over (order by num)    ) / (count(*) over ()    ) cume_st_calc
from
  tq84_cume
order by
    num;
--       NUM   CUME_DST CUME_ST_CALC
------------ ---------- ------------
--         1         .2           .2
--         2         .6           .4     <- Note disrepancy here!
--         2         .6           .4     <- Note disrepancy here!
--         9         .8           .8
--        10          1            1

drop table tq84_cume;
