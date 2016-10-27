select
  to_char(platform_id, '99'),
  platform_name,
  endian_format
from
  v$transportable_platform
order by
  lower(platform_name);
--
--  6   AIX-Based Systems (64-bit)          Big
-- 16   Apple Mac OS                        Big
-- 21   Apple Mac OS (x86-64)               Little
-- 19   HP IA Open VMS                      Little
-- 15   HP Open VMS                         Little
--  5   HP Tru64 UNIX                       Little
--  3   HP-UX (64-bit)                      Big
--  4   HP-UX IA (64-bit)                   Big
-- 18   IBM Power Based Linux               Big
--  9   IBM zSeries Based Linux             Big
-- 10   Linux IA (32-bit)                   Little
-- 11   Linux IA (64-bit)                   Little
-- 13   Linux x86 64-bit                    Little
--  7   Microsoft Windows IA (32-bit)       Little
--  8   Microsoft Windows IA (64-bit)       Little
-- 12   Microsoft Windows x86 64-bit        Little
-- 17   Solaris Operating System (x86)      Little
-- 20   Solaris Operating System (x86-64)   Little
--  1   Solaris[tm] OE (32-bit)             Big
--  2   Solaris[tm] OE (64-bit)             Big
