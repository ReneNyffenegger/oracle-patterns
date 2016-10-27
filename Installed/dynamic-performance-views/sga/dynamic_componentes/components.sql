select
  component
from
  v$sga_dynamic_components
order by
  lower(component);
--
-- ASM Buffer Cache
-- DEFAULT 16K buffer cache
-- DEFAULT 2K buffer cache
-- DEFAULT 32K buffer cache
-- DEFAULT 4K buffer cache
-- DEFAULT 8K buffer cache
-- DEFAULT buffer cache
-- java pool
-- KEEP buffer cache
-- large pool
-- RECYCLE buffer cache
-- Shared IO Pool
-- shared pool
-- streams pool
