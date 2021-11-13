create table tq84_hist_test (
   id     number generated always as identity primary key,
   vc     varchar2(10),
   nm     number
);

insert into tq84_hist_test (vc, nm) values ('four' ,  2);
insert into tq84_hist_test (vc, nm) values ('three',  3);
insert into tq84_hist_test (vc, nm) values ('four' ,  4);
insert into tq84_hist_test (vc, nm) values ('four' ,  1);
insert into tq84_hist_test (vc, nm) values ('two'  ,  4);
insert into tq84_hist_test (vc, nm) values ('two'  ,  3);
insert into tq84_hist_test (vc, nm) values ('three',  3);
insert into tq84_hist_test (vc, nm) values ('one'  ,  4);
insert into tq84_hist_test (vc, nm) values ('three',  2);
insert into tq84_hist_test (vc, nm) values ('four' ,  4);

begin
    dbms_stats.gather_table_stats(
        ownname    =>  user,
        tabname    => 'tq84_hist_test',
        method_opt => 'for columns'    ||
                         ' vc size  4' ||
                         ' nm size  2'
    );
end;
/

select
   substr(endpoint_actual_value, 1, 10) end_value,
   endpoint_number
from
   user_tab_histograms
where
   table_name  = 'TQ84_HIST_TEST' and
   column_name = 'VC'
order by
   endpoint_number;
--
-- END_VALUE  ENDPOINT_NUMBER
-- ---------- ---------------
-- four                     4
-- one                      5
-- three                    8
-- two                     10

select
   substr(endpoint_actual_value, 1, 10) end_value,
   endpoint_number
from
   user_tab_histograms
where
   table_name  = 'TQ84_HIST_TEST' and
   column_name = 'NM'
order by
   endpoint_number;
--
-- END_VALUE  ENDPOINT_NUMBER
-- ---------- ---------------
-- 1                        1
-- 4                        5

drop table tq84_hist_test;
