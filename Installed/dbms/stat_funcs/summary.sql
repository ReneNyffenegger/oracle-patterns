create table tq84_some_table (
  col_data number
);

begin

  dbms_random.seed(280870);

  for r in 1 .. 1000 loop

      insert into tq84_some_table values (round(dbms_random.normal * 20 + 100, 2));

  end loop;

end;
/


declare
  summary dbms_stat_funcs.summaryType;
begin

  dbms_stat_funcs.summary(
    p_ownername  => user,
    p_tablename  =>'tq84_some_table',
    p_columnname =>'col_data',
    s            => summary);

  dbms_output.put_line('count           : ' || to_char(summary.count          , '99990'   ));
  dbms_output.put_line('min             : ' || to_char(summary.min            , '99990.99'));
  dbms_output.put_line('max             : ' || to_char(summary.max            , '99990.99'));
  dbms_output.put_line('range           : ' || to_char(summary.range          , '99990.99'));
  dbms_output.put_line('mean            : ' || to_char(summary.mean           , '99990.99'));
--dbms_output.put_line('cmode           : ' || to_char(summary.cmode          , '99990.99'));
  dbms_output.put_line('variance        : ' || to_char(summary.variance       , '99990.99'));
  dbms_output.put_line('stddev          : ' || to_char(summary.stddev         , '99990.99'));
  dbms_output.put_line('quantile_5      : ' || to_char(summary.quantile_5     , '99990.99'));
  dbms_output.put_line('quantile_25     : ' || to_char(summary.quantile_25    , '99990.99'));
  dbms_output.put_line('median          : ' || to_char(summary.median         , '99990.99'));
  dbms_output.put_line('quantile_75     : ' || to_char(summary.quantile_75    , '99990.99'));
  dbms_output.put_line('quantile_95     : ' || to_char(summary.quantile_95    , '99990.99'));
  dbms_output.put_line('plus_x_sigma    : ' || to_char(summary.plus_x_sigma   , '99990.99'));
  dbms_output.put_line('minus_x_sigma   : ' || to_char(summary.minus_x_sigma  , '99990.99'));

  dbms_output.new_line;
  dbms_output.put_line('c-mode');
  for i in 1 .. summary.cmode.count loop
      dbms_output.put_line('  ' || to_char(summary.cmode(i), '990.99'));
  end loop;

  dbms_output.new_line;
  dbms_output.put_line('Extreme values (comp min/max)');
  for i in 1 .. summary.extreme_values.count loop
      dbms_output.put_line('  ' || to_char(summary.extreme_values(i), '990.99'));
  end loop;

  dbms_output.new_line;
  dbms_output.put_line('Top five values');
  for i in 1 .. summary.top_5_values.count loop
      dbms_output.put_line('  ' || to_char(summary.top_5_values(i), '990.99'));
  end loop;

  dbms_output.new_line;
  dbms_output.put_line('Bottom five values');
  for i in 1 .. summary.bottom_5_values.count loop
      dbms_output.put_line('  ' || to_char(summary.bottom_5_values(i), '990.99'));
  end loop;



end;
/
-- 
-- count           :   1000
-- min             :     28.55
-- max             :    161.10
-- range           :    132.55
-- mean            :     99.01
-- variance        :    411.25
-- stddev          :     20.28
-- quantile_5      :     64.43
-- quantile_25     :     86.11
-- median          :     98.94
-- quantile_75     :    112.61
-- quantile_95     :    131.29
-- plus_x_sigma    :    159.85
-- minus_x_sigma   :     38.18
-- 
-- c-mode
--     99.24
--    116.69
--    111.95
--     86.19
-- 
-- Extreme values (comp min/max)
--    161.10
--     34.28
--     28.55
-- 
-- Top five values
--    161.10
--    158.40
--    154.59
--    152.18
--    149.28
-- 
-- Bottom five values
--     40.30
--     40.12
--     39.64
--     34.28
--     28.55



-- Same values as c-mode above:
select
  count(*),
  col_data
from
  tq84_some_table
where
  col_data in (99.24, 116.69, 111.95, 86.19)
group by
  col_data;
-- 
--   COUNT(*)   COL_DATA
-- ---------- ----------
--          3      99.24
--          3     116.69
--          3     111.95
--          3      86.19


drop table tq84_some_table;
