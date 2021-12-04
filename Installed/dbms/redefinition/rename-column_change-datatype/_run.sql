@ create-table
@ insert-data

--
-- Check if table can be redefined
--
@ can_redef_table
@ create-table-int
@ start_redef_table

--
-- Hopefully not used...
--
-- @ abort_redef_table

--
-- clone the dependent objects like grants, triggers, constraints and privileges from the table being redefined to the interim table (which represents the post-redefinition table).
--
@ copy_table_dependents

@ sync_interim_table

@ finish_redef_table

@ select

@ drop-tables
