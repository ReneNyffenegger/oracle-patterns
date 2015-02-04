connect rene/rene

-- https://github.com/ReneNyffenegger/oracle_scriptlets/blob/master/sqlpath/drop_schema_if_exists.sql
@drop_schema_if_exists    to_schema_A
@drop_schema_if_exists  from_schema_A
@drop_schema_if_exists       schema_B
@drop_schema_if_exists  exp_imp_admin

@utl_file_fremove DATAPUMP_DIR CLONE_SCHEMA_A.DMP

-- https://github.com/ReneNyffenegger/oracle_scriptlets/blob/master/sqlpath/drop_if_exists.sql
@drop_if_exists DATAPUMP_DIR

$@del c:\temp\CLONE_SCHEMA_A.DMP        >nul 2>&1
$@del c:\temp\clone_schema_a_export.log >nul 2>&1
$@del c:\temp\clone_schema_a_import.log >nul 2>&1
