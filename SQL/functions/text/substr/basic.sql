select
   substr(
      '1234567890', -- Text
       5            -- Start position
   )
from
   dual;
--
-- 567890


select
   substr(
      '1234567890', -- Text
       5          , -- Start position
       3            -- Length
   )
from
   dual;
--
-- 567
