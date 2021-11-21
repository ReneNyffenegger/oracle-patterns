create or replace procedure dump_block_from_rowid(p_rowid rowid)
--
-- Requires
--    grant alter system to …
-- in order to execute procedure.
--
is

   dump_file varchar2(4000);

begin

   execute immediate '
     alter system dump datafile ' ||
       dbms_rowid.rowid_relative_fno(p_rowid) || '
     block ' ||
       dbms_rowid.rowid_block_number(p_rowid);

   select
      value
   into
      dump_file
   from
      v$diag_info
   where
      name = 'Default Trace File';

   dbms_output.put_line('  dumped block to: ' ||  dump_file);

end;
/
