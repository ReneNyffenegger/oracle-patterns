--
-- Show privileges on directories
--
select
  dir.directory_name                                   dir_name,
  prv.grantee                                           grantee,
  max(case when prv.privilege = 'READ'    then 'r' end)        r,
  max(case when prv.privilege = 'WRITE'   then 'w' end)        w,
  max(case when prv.privilege = 'EXECUTE' then 'e' end)        e,
  dir.directory_path                                    dir_path
from
  dba_directories       dir left join
  dba_tab_privs         prv on dir.directory_name = prv.table_name
group by
  dir.directory_name,
  dir.directory_path,
  prv.grantee
order by
  dir.directory_name,
  prv.grantee;
