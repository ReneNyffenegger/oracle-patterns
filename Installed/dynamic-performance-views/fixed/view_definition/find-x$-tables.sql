select * from (
  select
    lower(view_name) view_name,
    regexp_replace(
      regexp_replace(lower(view_definition), '.*?(x\$[a-z_]+)', '\1 - '),
     '(.*) - .*?$', '\1'
    ) x
  from
    v$fixed_view_definition
)
where
  x like '%x$%'
order by
  view_name;
