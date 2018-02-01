select * from (
  select *
  from
    top_n_test
  order by
    num
)
where
  rownum between 4 and 6;
