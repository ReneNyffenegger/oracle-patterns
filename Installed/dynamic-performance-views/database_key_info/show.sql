select
  encryptionalg,
  encrytpedkey,   -- (sic!)
  masterkeyid
from
  v$database_key_info;
