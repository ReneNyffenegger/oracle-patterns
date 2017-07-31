create table tq84_ilm_policy (
  id    number primary key,
  col_1 varchar2(10),
  col_2 varchar2(10)
)
;

alter table tq84_ilm_policy 
  ilm add policy row store compress advanced segment after 3 days of no modification;
