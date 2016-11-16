select
   loc.owner,
   loc.table_name,
   dir.directory_path           file_path,
   loc.location                 file_name,
   loc.directory_name,
-- tab.default_directory_name,
   tab.type_name,               -- ORACLE_LOADER
   tab.reject_limit,
   tab.access_type,             -- CLOB
   tab.access_parameters
from
   dba_external_locations   loc /* full outer */                                  join
   dba_external_tables      tab on loc.owner           = tab.owner           and
                                   loc.table_name      = tab.table_name           join
   dba_directories          dir on loc.directory_owner = loc.directory_owner and
                                   loc.directory_name  = dir.directory_name
order by
   loc.owner,
   loc.table_name
;
