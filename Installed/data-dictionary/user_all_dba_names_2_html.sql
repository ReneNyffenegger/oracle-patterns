@spool user_all_dba_names.html
select '<table>' from dual;

with u as ( select substr(object_name, 6) obj, object_name from dba_objects where owner = 'SYS' and object_name like 'USER\_%' escape '\'), -- '
     a as ( select substr(object_name, 5) obj, object_name from dba_objects where owner = 'SYS' and object_name like  'ALL\_%' escape '\'), -- '
     d as ( select substr(object_name, 5) obj, object_name from dba_objects where owner = 'SYS' and object_name like  'DBA\_%' escape '\'), -- '
     o as ( select obj from u union
            select obj from a union
            select obj from d)
select
 '<tr>' ||
 '<td>Todo:</td>' ||
   '<td>' || nvl2(u.obj,   '<a href="' || rpad(lower(o.obj || '"'), 26) || '>user_' || rpad(lower(o.obj), 25) || '</a>', rpad(' ', 70)) || '</td>' ||
   '<td>' || nvl2(a.obj,   '<a href="' || rpad(lower(o.obj || '"'), 26) || '>all_'  || rpad(lower(o.obj), 25) || '</a>', rpad(' ', 70)) || '</td>' ||
   '<td>' || nvl2(d.obj,   '<a href="' || rpad(lower(o.obj || '"'), 26) || '>dba_'  || rpad(lower(o.obj), 25) || '</a>', rpad(' ', 70)) || '</td>' ||
 '</tr>'
from
  o                  left join
  u on o.obj = u.obj left join
  a on o.obj = a.obj left join
  d on o.obj = d.obj
order by
  o.obj;

select '<table>' from dual;
@spool off
