select
--algorithm_id,
  algorithm_name,
--initial_release,
--terminal_release,
  algorithm_description
--algorithm_compatibility,
--is_valid,
--requires_aco,
--is_default
from
  v$rman_compression_algorithm;
-- 
-- BZIP2    good compression ratio
-- BASIC    good compression ratio
-- LOW      maximum possible compression speed
-- ZLIB     balance between speed and compression ratio
-- MEDIUM   balance between speed and compression ratio
-- HIGH     maximum possible compression ratio
