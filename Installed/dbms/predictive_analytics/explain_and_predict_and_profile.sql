drop table tq84_pred_data       purge;
drop table tq84_pred_result     purge;
drop table tq84_pred_prediction purge;

create table tq84_pred_data (
  id    number  primary key,
  x_1   number,
  x_2   number,
  x_3   number,
  res   number
);

declare
  row_ tq84_pred_data%rowtype;

  rnd  number;
  x2   number;
  dt   number;

begin



  for i in 1 .. 100 loop

    row_.id  := i;
    row_.x_1 := 4 * dbms_random.normal + 10;
    row_.x_2 := 5 * dbms_random.normal +  6;
    row_.x_3 := 6 * dbms_random.normal + 12;

    if    row_.x_1 < 7    then
          row_.res := 0;
    else

      if row_.x_2 < 8 then
         row_.res := 1;
      else

        if row_.x_3 < 11 then
          row_.res := 0;
        else
          row_.res := 1;
        end if;

      end if;

    end if;
       

    insert into tq84_pred_data values row_;
  end loop;

end;
/

commit;

-- select count(*) from tq84_pred_data;
-- select       *  from tq84_pred_data;
   select count(*), res from tq84_pred_data group by res;

begin

  dbms_predictive_analytics.explain (
    data_table_name     => 'tq84_pred_data',
    explain_column_name => 'res',
    result_table_name   => 'tq84_pred_result'
  );

end;
/

select
  substrb(attribute_name   , 1, 30) attribute_name,
  substrb(attribute_subname, 1, 30) attribute_subname,
  explanatory_value                 explanatory_value,
  rank                              rank
from
  tq84_pred_result
order by
  rank;


declare
  v_accuracy number;
begin

  dbms_predictive_analytics.predict (
    accuracy            =>  v_accuracy,
    data_table_name     => 'tq84_pred_data',
    case_id_column_name => 'id',
    target_column_name  => 'res',
    result_table_name   => 'tq84_pred_prediction'
  );

  dbms_output.put_line('accuracy: ' || v_accuracy);

end;
/

select 
  p.prediction,
  d.res
from
  tq84_pred_prediction p join
  tq84_pred_data       d on p.id = d.id;


begin

  dbms_predictive_analytics.profile (
    data_table_name    => 'tq84_pred_data',
    target_column_name => 'res',
    result_table_name  => 'tq84_pred_profile'
  );

end;
/

select
  count(*),
  sum(record_count)
from
  tq84_pred_profile;

select
--profile_id,
--record_count,
  description
from
  tq84_pred_profile;
