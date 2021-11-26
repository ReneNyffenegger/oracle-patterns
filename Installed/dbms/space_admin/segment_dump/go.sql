create table tq84_space_admin_seg_dmp_tst (
   num  number,
   txt  varchar2(1000)
);

begin

   for i in 1 .. 20 loop
       insert into tq84_space_admin_seg_dmp_tst values(i, rpad('*', 1000, '*'));
   end loop;

end;
/

commit;

declare

   ts_name   varchar2(128);
   file_id   number;
   block_id  number;
   dump_file varchar2(1000);

begin

   select tablespace_name, header_file, header_block
   into   ts_name        , file_id    , block_id
   from   dba_segments
   where  segment_name = 'TQ84_SPACE_ADMIN_SEG_DMP_TST' and
          owner        =  user;

 - sys.dbms_space_admin.segment_dump(ts_name, file_id, block_id, sys.dbms_space_admin.segment_dump_extent_map    );
   sys.dbms_space_admin.segment_dump(ts_name, file_id, block_id, sys.dbms_space_admin.segment_dump_bitmap_summary);

   select value into   dump_file
   from   v$diag_info
   where  name = 'Default Trace File';

   dbms_output.put_line('  dumped block to: ' ||  dump_file);

end;
/

drop table tq84_space_admin_seg_dmp_tst;
