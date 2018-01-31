select
  owner,
  table_name,
  grantee,
  grantor,
  max(case when privilege = 'SELECT'            then 'sel' end) sel,
  max(case when privilege = 'INSERT'            then 'ins' end) ins,
  max(case when privilege = 'UPDATE'            then 'upd' end) upd,
  max(case when privilege = 'DELETE'            then 'del' end) del,
  max(case when privilege = 'ALTER'             then 'alt' end) alt,
  max(case when privilege = 'READ'              then 'rea' end) rea,
  max(case when privilege = 'QUERY REWRITE'     then 'qrr' end) qrr,
  max(case when privilege = 'DEBUG'             then 'dbg' end) dbg,
  max(case when privilege = 'ON COMMIT REFRESH' then 'ocr' end) ocr,
  max(case when privilege = 'FLASHBACK'         then 'flb' end) flb
from
  dba_tab_privs
where
  owner not in ('SYS', 'SYSTEM', 'APPQOSSYS', 'DBSNMP', 'GSMADMIN_INTERNAL', 'XDB', 'WMSYS')
group by
  owner,
  table_name,
  grantee,
  grantor
order by
  owner,
  table_name,
  grantee,
  grantor;
