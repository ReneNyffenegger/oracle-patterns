connect rene/rene
@cleanup


create directory DATAPUMP_DIR as 'C:\temp';

@create_schemas.sql

@@export_import_plsql

select object_type, object_name from dba_objects where owner = 'TO_SCHEMA_A';
select name, line, substrb(text, 1, 50) from dba_errors where owner = 'TO_SCHEMA_A';

-- Since to_schema_A will also access the same tables
-- in schema_b that from_schema_A accesses, we also
-- need to grant the relevant grants for to_schema_A:
connect schema_B/p
grant insert, select on table_b_1 to to_schema_A;

connect to_schema_a/p
insert into table_a_1 values (999, 'foo bar');

@@call_count_procs
