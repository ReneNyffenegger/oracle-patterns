select * from (
  select *
  from
    top_n_test
  order by
    num
)
where
  rownum < 4;
