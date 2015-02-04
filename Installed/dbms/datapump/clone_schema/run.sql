connect rene/rene
@cleanup


create directory DATAPUMP_DIR as 'C:\temp';

@create_schemas.sql

connect exp_imp_admin/p

@@export_import_plsql
--@@export_import_dp


-- Since to_schema_A will also access the same tables
-- in schema_b that from_schema_A accesses, we also
-- need to grant the relevant grants for to_schema_A:
connect schema_B/p
grant insert, select on table_b_1 to to_schema_A;

connect to_schema_a/p
insert into table_a_1 values (999, 'foo bar');

select object_type, object_name from dba_objects where owner = 'TO_SCHEMA_A';
select name, line, substrb(text, 1, 50) from all_errors where owner = 'TO_SCHEMA_A';

@@call_count_procs
