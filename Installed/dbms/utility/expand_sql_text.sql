create table tq84_tab_1 (
  col_1 number,
  col_2 varchar2(10)
);

create table tq84_tab_2 (
  col_1 number,
  col_2 varchar2(10)
);

create view tq84_view_a as
  select
    a.col_2  col_a,
    b.col_2  col_b
  from
    tq84_tab_1 a                       left join
    tq84_tab_2 b on a.col_1 = b.col_1
  where
    a.col_1 < 5
;
    
declare
  c clob;
begin
  dbms_utility.expand_sql_text(
    input_sql_text  => 'select * from tq84_view_a where col_b >= ''foo''',
    output_sql_text =>  c);

  dbms_output.put_line(c);
end;
/

drop view  tq84_view_a;
drop table tq84_tab_2   purge;
drop table tq84_tab_1   purge;
