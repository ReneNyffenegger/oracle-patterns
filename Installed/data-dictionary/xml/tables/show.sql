select
  owner,
  table_name,
  xmlschema,
  schema_owner,
  element_name,
  storage_type,
  anyschema,
  nonschema
from
  dba_xml_tables
order by
  owner,
  table_name;
