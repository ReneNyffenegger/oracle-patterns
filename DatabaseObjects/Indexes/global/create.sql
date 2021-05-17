create table tq84_tab (
   nm   number,
   tx   varchar2(10),
   val  number
);


create index tq84_ix
       on    tq84_tab (nm, tx)
       global partition by range(nm)
       (
         partition lt_1e6 values less than (   100000),
         partition lt_2e6 values less than (   200000),
         partition lt_3e6 values less than (   300000),
         partition lt_4e6 values less than (   400000),
         partition lt_5e6 values less than (   500000),
         partition lt_inf values less than ( maxvalue)
     )
;


drop table tq84_tab;
