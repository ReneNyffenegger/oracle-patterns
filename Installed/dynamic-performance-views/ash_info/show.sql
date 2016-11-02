select
  inst_id,
  sampling_interval                                                      sampling_interval_ms, -- Assumption!
  extract(hour   from latest_sample_time - oldest_sample_time) * 60 +
  extract(minute from latest_sample_time - oldest_sample_time)           minutes_stored,

  to_char(oldest_sample_time, 'hh24:mi:ss')                              oldest_sample,
  to_char(latest_sample_time, 'hh24:mi:ss')                              latest_sample,
  sample_count                                                           cnt_samples,
  to_char(sampled_bytes / 1024/1024, '999.00')                           size_sampled_mb,      -- ?
  to_char(total_size    / 1024/1024, '999.00')                           size_mb,
  sampler_elapsed_time,
  awr_flush_count,
  awr_flush_emergency_count,
  disk_filter_ratio
from
  gv$ash_info
;
