select
        '  ' ||
   u || ' ☰ ' ||
   a || ' ☰ ' ||
   d || ' ☰ ' ||
   c || ' ☰ ' ||
   ---------------------------------
   case o 
        when 'REGISTRY'          then ' → development/databases/Oracle/installed/data-dictionary/registry[REGISTRY]'
        when 'REGISTRY_SQLPATCH' then ' → development/databases/Oracle/installed/data-dictionary/registry/sqlpatch[REGISTRY_SQLPATCH]'
        else o
   end
   ---------------------------------
   || ' ☰ ' ||
   ---------------------------------
   case o
        when 'REGISTRY_SQLPATCH' then 'Information about SQL patches that have been installed in the database'
        else coalesce(ca, cd, cc, cu)
   end
from
   user_all_dba_cdb_v
order by
   o;
