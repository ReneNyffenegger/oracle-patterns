--
-- Determine hex representation of "Hello world"
--
select
  rawtohex(
    utl_raw.cast_to_raw('Hello world')
  ) hex
from
  dual;
  
-- 48656C6C6F20776F726C64
