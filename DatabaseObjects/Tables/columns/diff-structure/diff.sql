with a as (select * from dba_tab_columns where owner = user and table_name = 'X'),
     b as (select * from dba_tab_columns where owner = user and table_name = 'Y')
select
     coalesce(a.column_name, b.column_name)                 col_name,
     --
     a.column_id        column_id_a     , b.column_id       column_id_b,
     a.data_type        data_type_a     , b.data_type       data_type_b     ,
     a.data_length      data_length_a   , b.data_length     data_length_b   ,
     a.data_scale       data_scale_a    , b.data_scale      data_scale_b    ,
     a.data_precision   data_precision_a, b.data_precision  data_precision_b,
     a.nullable         nullable_a      , b.nullable        nullable_b      ,
     a.last_analyzed    last_analyzed_a , b.last_analyzed   last_analyzed_b ,
     a.sample_size      sample_size_a   , b.sample_size     sample_size_b   ,
     a.num_distinct     num_distinct_a  , b.num_distinct    num_distinct_b  ,
     a.low_value        low_value_a     , b.low_value       low_value_b 
from
     a                full outer join
     b on a.column_name = b.column_name
order by
    coalesce (a.column_id, b.column_id);
