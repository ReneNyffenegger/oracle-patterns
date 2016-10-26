with fmh as (
  select
    dense_rank() over (order by begin_time desc) dr,
  --begin_time,
    file_id,
    average_read_time      avg_read_tm,
    average_write_time     avg_write_tm,
    physical_reads         phys_r,
    physical_writes        phys_w,
    physical_block_reads   phys_bl_r,
    physical_block_writes  phys_bl_w
  from
    v$filemetric_history
)
select
  dbf.name,
  max(case fmh.dr when 1 then avg_read_tm     end) avg_read_tm_1,
  max(case fmh.dr when 2 then avg_read_tm     end) avg_read_tm_2,
  max(case fmh.dr when 3 then avg_read_tm     end) avg_read_tm_3,
  max(case fmh.dr when 4 then avg_read_tm     end) avg_read_tm_4,
  max(case fmh.dr when 5 then avg_read_tm     end) avg_read_tm_5,
  max(case fmh.dr when 6 then avg_read_tm     end) avg_read_tm_6,
  max(case fmh.dr when 7 then avg_read_tm     end) avg_read_tm_7,
 '|' b1,
  max(case fmh.dr when 1 then avg_write_tm    end) avg_write_tm_1,
  max(case fmh.dr when 2 then avg_write_tm    end) avg_write_tm_2,
  max(case fmh.dr when 3 then avg_write_tm    end) avg_write_tm_3,
  max(case fmh.dr when 4 then avg_write_tm    end) avg_write_tm_4,
  max(case fmh.dr when 5 then avg_write_tm    end) avg_write_tm_5,
  max(case fmh.dr when 6 then avg_write_tm    end) avg_write_tm_6,
  max(case fmh.dr when 7 then avg_write_tm    end) avg_write_tm_7,
 '|' b2,
  max(case fmh.dr when 1 then phys_r          end) phys_r_1,
  max(case fmh.dr when 2 then phys_r          end) phys_r_2,
  max(case fmh.dr when 3 then phys_r          end) phys_r_3,
  max(case fmh.dr when 4 then phys_r          end) phys_r_4,
  max(case fmh.dr when 5 then phys_r          end) phys_r_5,
  max(case fmh.dr when 6 then phys_r          end) phys_r_6,
  max(case fmh.dr when 7 then phys_r          end) phys_r_7,
 '|' b3,
  max(case fmh.dr when 1 then phys_w          end) phys_w_1,
  max(case fmh.dr when 2 then phys_w          end) phys_w_2,
  max(case fmh.dr when 3 then phys_w          end) phys_w_3,
  max(case fmh.dr when 4 then phys_w          end) phys_w_4,
  max(case fmh.dr when 5 then phys_w          end) phys_w_5,
  max(case fmh.dr when 6 then phys_w          end) phys_w_6,
  max(case fmh.dr when 7 then phys_w          end) phys_w_7,
 '|' b4,
  max(case fmh.dr when 1 then phys_bl_r       end) phys_bl_r_1,
  max(case fmh.dr when 2 then phys_bl_r       end) phys_bl_r_2,
  max(case fmh.dr when 3 then phys_bl_r       end) phys_bl_r_3,
  max(case fmh.dr when 4 then phys_bl_r       end) phys_bl_r_4,
  max(case fmh.dr when 5 then phys_bl_r       end) phys_bl_r_5,
  max(case fmh.dr when 6 then phys_bl_r       end) phys_bl_r_6,
  max(case fmh.dr when 7 then phys_bl_r       end) phys_bl_r_7,
 '|' b5,
  max(case fmh.dr when 1 then phys_bl_w       end) phys_bl_w_1,
  max(case fmh.dr when 2 then phys_bl_w       end) phys_bl_w_2,
  max(case fmh.dr when 3 then phys_bl_w       end) phys_bl_w_3,
  max(case fmh.dr when 4 then phys_bl_w       end) phys_bl_w_4,
  max(case fmh.dr when 5 then phys_bl_w       end) phys_bl_w_5,
  max(case fmh.dr when 6 then phys_bl_w       end) phys_bl_w_6,
  max(case fmh.dr when 7 then phys_bl_w       end) phys_bl_w_7
from
  fmh                 join
  v$dbfile dbf on fmh.file_id = dbf.file#
group by
  dbf.name
;
