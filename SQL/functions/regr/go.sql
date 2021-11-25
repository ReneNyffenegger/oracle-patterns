create table tq84_regr_t (
   x   number,
   y   number
);

declare
    slope        number :=  0.24;
    intercept    number := -8.1 ;

    x            number;
    y            number;
begin
   for n in 1 .. 100 loop

       x := dbms_random.value(0, 100);
       y := intercept + slope*x  + dbms_random.value(0, 2.3);

       insert into tq84_regr_t values (x, y);

   end loop;
end;
/

commit;

select
   round(regr_slope    (y, x), 2) slope    ,
   round(regr_intercept(y, x), 2) intercept,
   round(regr_avgx     (y, x), 2) avgx     , round(avg(x), 2) avg_x,
   round(regr_avgy     (y, x), 2) avgy     , round(avg(y), 2) avg_y,
   round(regr_sxx      (y, x), 2) sxx      ,
   round(regr_sxy      (y, x), 2) sxy      ,
   round(regr_syy      (y, x), 2) syy      ,
   round(regr_r2       (y, x), 2) r2       ,
   round(regr_count    (y, x), 2) cnt
from
   tq84_regr_t;

drop table tq84_regr_t;
