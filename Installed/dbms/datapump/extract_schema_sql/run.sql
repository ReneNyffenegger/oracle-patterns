connect / as sysdba

@@drop_if_exists DATAPUMP_DIR
create directory DATAPUMP_DIR as 'c:\temp';

@@create_schema

@@export_dump.plsql
@@export_sql.plsql

@@import_sql_file

$@del c:\temp\EXPORT.DMP
$@del c:\temp\schema.sql
