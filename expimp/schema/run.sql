--
--  Create a schema, named «just_a_schema» that
--  will be cloned with imp/exp:
--
@create_schema

-- Create a sql script that is needed to re-create
--«just_a_schema». The name of the created
-- script is «just_a_user_clone.sql» and will be
-- called further below.
@create_user_script

--
-- Do the export.
--
host exp userid=just_a_schema/x owner=just_a_schema file=exp.dmp log=exp.log

@drop_schema

--
-- Re-create an empty schema
-- just_a_user_clone.sql is created by create_user_script.sql
@just_a_user_clone.sql

host imp meta/meta touser=just_a_schema full=y file=exp.dmp log=imp.log

connect just_a_schema/x

--
--  Check if data, trigger and sequence are cloned.
--
insert into a_tbl(txt) values ('record after import');
select * from a_tbl;
