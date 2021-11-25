create table tq84_dump_segment_header_test (
   num  number,
   txt  varchar2(1000)
);

begin

   for i in 1 .. 20 loop
       insert into tq84_dump_segment_header_test values(i, rpad('*', 1000, '*'));
   end loop;

end;
/

commit;

declare

   file_id   number;
   block_id  number;
   dump_file varchar2(1000);

begin

   select header_file, header_block
   into  file_id, block_id
   from  dba_segments
   where segment_name = 'TQ84_DUMP_SEGMENT_HEADER_TEST' and
         owner        =  user;

   execute immediate 'alter system dump datafile ' || file_id || ' block ' || block_id;


   select value into   dump_file
   from   v$diag_info
   where  name = 'Default Trace File';

   dbms_output.put_line('  dumped block to: ' ||  dump_file);

end;
/

drop table tq84_dump_segment_header_test;
