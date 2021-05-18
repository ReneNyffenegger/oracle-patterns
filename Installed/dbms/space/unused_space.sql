drop   table tq84_unused_space_test purge;

create table tq84_unused_space_test (
   nm  number,
   tx  varchar2(4000)
);

declare
   tx                         varchar2(4000);

   total_blocks               number;
   total_bytes                number;
   unused_blocks              number;
   unused_bytes               number;
   last_used_extent_file_id   number;
   last_used_extent_block_id  number;
   last_used_block            number;

   segment_bytes              number;
   segment_blocks             number;
   segment_extents            number;

   extent_cnt                 number;

begin

   for rec_no in 0 .. 200 loop

       select
       --
       -- Use aggregate functions because no segments are recorded
       -- after creation of table.
       --
          nvl(max(bytes   ), 0),
          nvl(max(blocks  ), 0),
          nvl(max(extents ), 0)
       into
          segment_bytes,
          segment_blocks,
          segment_extents
       from
          user_segments
       where
          segment_name = 'TQ84_UNUSED_SPACE_TEST';

       select count(*) into extent_cnt from user_extents where segment_name = 'TQ84_UNUSED_SPACE_TEST';

       dbms_space.unused_space (
          segment_owner             => user                      ,
          segment_name              =>'TQ84_UNUSED_SPACE_TEST'   ,
          segment_type              =>'table'                    ,
          total_blocks              => total_blocks              ,
          total_bytes               => total_bytes               ,
          unused_blocks             => unused_blocks             ,
          unused_bytes              => unused_bytes              ,
          last_used_extent_file_id  => last_used_extent_file_id  ,
          last_used_extent_block_id => last_used_extent_block_id ,
          last_used_block           => last_used_block
       );

       insert into tq84_unused_space_test (nm, tx) values (rec_no, rpad (
          to_char( last_used_block          ,     '999') ||
          to_char( last_used_extent_file_id ,     '999') ||
          to_char( last_used_extent_block_id,  '999999') || ' | ' ||

          to_char(    total_blocks          ,    '9999') ||
          to_char(   unused_blocks          ,    '9999') ||
          to_char(     total_bytes / 1024   ,   '99999') ||
          to_char(    unused_bytes / 1024   ,   '99999') || ' | ' ||

          to_char(  segment_blocks          ,    '9999') ||
          to_char(  segment_bytes  / 1024   ,   '99999') ||
          to_char(  segment_extents         ,     '999') || ' | ' ||

          to_char(   extent_cnt             ,      '99')
          ,
          1200
       ));

   end loop;

end;
/

commit;
