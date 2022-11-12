create table tq84_pq_tqstat (
   grp  char(1) not null,
   num  number
) parallel 4;

insert into tq84_pq_tqstat
select
   chr(ascii('A') + dbms_random.value(0, 25)),
   dbms_random.value(1,100000)
from
   dual connect by level <= 10000;

select
   grp,
   sum(num),
   count(*)
from
   tq84_pq_tqstat
group by
   grp
order by
   grp
;

select
   pqt.dfo_number ,  -- Identification of DFO Tree
   pqt.tq_id      ,  -- Table Queue
   pqt.server_type,  -- Ranger, Producer or Consumer (with trailing spaces!)
   pqt.process    ,  -- Pnnn or QC
   pqt.num_rows   ,
   pqt.bytes      ,
   pqt.avg_latency,
   pqt.waits      ,
   pqt.timeouts   ,
   pqt.instance   , 
   pqt.con_id
from
   v$pq_tqstat pqt
order by
   pqt.dfo_number,
   pqt.tq_id,
   decode(rtrim(pqt.server_type),
     'Ranger'  ,  1,
     'Producer',  2,
     'Consumer',  3,
                 99)
;

drop table tq84_pq_tqstat;
