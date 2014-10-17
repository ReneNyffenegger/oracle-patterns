create table tq84_regr_slope (
  x  number,
  y1 number,
  y2 number,
  y3 number,
  y4 number,
  y5 number
);


declare
  x_   number;
begin

  for x__ in 0 .. 100 loop

      x_ := x__ / 10;

      insert into tq84_regr_slope values (

        x_,
        50,
        x_ * 10,
        x_ * x_,
       (x_ - 3) * (x_ - 3),
        sin(x_)
      );

      
  end loop;
end;
/


select * from tq84_regr_slope order by x;

select
  regr_slope(x, y1),
  regr_slope(x, y2),
  regr_slope(x, y3),
  regr_slope(x, y4),
  regr_slope(x, y5)
from
  tq84_regr_slope;


drop table tq84_regr_slope purge;
