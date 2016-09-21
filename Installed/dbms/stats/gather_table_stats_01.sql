drop table tq84_tab_stat purge;

create table tq84_tab_stat (
  pk      number primary key,
  nm      number,
  vc      varchar2(20),
  dt      date
);


declare
  rec  tq84_tab_stat%rowtype;
begin

  for i in 0 .. 999 loop

    rec.pk := i + 100000;

    rec.nm := case
      when i < 300  then 5
      when i < 500  then 7
      when i < 600  then 3.141
      when i < 700  then null
      else               i/3 end;

    rec.vc := case
      when i < 400  then 'foo bar baz'
      when i < 700  then 'ab cdefgh ijklmno'
      when i < 800  then 'zgraggen'
      when i < 900  then  dbms_random.string('x', 10)
      else                null end;

    rec.dt := case
      when i < 200  then  date '2010-08-13'
      when i < 300  then  to_date ('2015-05-20 13:56:07', 'yyyy-mm-dd hh24:mi:ss')
      when i < 800  then  date '2016-01-01' + 1127/500 * i
      else                null end;

    insert into tq84_tab_stat values rec;
          

  end loop;

end;
/

commit;

exec dbms_stats.gather_table_stats(user, 'tq84_tab_stat', method_opt => 'for all columns size 10');

column column_name format a4
column data_type   format a20

select
  h.column_name,
  h.endpoint_number,
  --endpoint_number - lag(endpoint_number) over (order by ) x,
--substrb(h.endpoint_actual_value, 1, 50),
  case c.data_type
    when 'NUMBER'   then to_char(h.endpoint_value)
    when 'DATE'     then to_char(to_date(to_char(h.endpoint_value, 'FM99999999') || '.' || to_char(86400 * mod(h.endpoint_value, 1), 'FM99999'), 'J.sssss'))
    when 'VARCHAR2' then chr(to_number(substr(to_char(h.endpoint_value, 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'), 2, 2), 'XX')) ||
                         chr(to_number(substr(to_char(h.endpoint_value, 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'), 4, 2), 'XX')) ||
                         chr(to_number(substr(to_char(h.endpoint_value, 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'), 6, 2), 'XX')) ||
                         chr(to_number(substr(to_char(h.endpoint_value, 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'), 8, 2), 'XX')) ||
                         chr(to_number(substr(to_char(h.endpoint_value, 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'),10, 2), 'XX')) ||
                         chr(to_number(substr(to_char(h.endpoint_value, 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'),12, 2), 'XX')) 
  end
from
  user_tab_histograms h  join
  user_tab_columns    c  on h.table_name  = c.table_name and
                            h.column_name = c.column_name
where
  h.table_name = 'TQ84_TAB_STAT'
order by
  c.column_id,
  h.endpoint_number;

