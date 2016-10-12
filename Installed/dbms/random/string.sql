
column chars      format a24
column string_out format a40


select
  chars,
  opt || ': ' || dbms_random.string(opt, 30) string_out
from (
  select 'Uppercase alpha'         chars, 'u' opt from dual union all
  select 'Lowercase alpha'         chars, 'l' opt from dual union all
  select 'Mixed-case alpha'        chars, 'a' opt from dual union all
  select 'Uppercase alpha-numeric' chars, 'x' opt from dual union all
  select 'Printable'               chars, 'p' opt from dual
);
-- Uppercase alpha          u: DFYCTGQJZHIRIUONMOAXAXTWAHAYRV
-- Lowercase alpha          l: zjvfynxhkleqckljdwrdsutdkemzbk
-- Mixed-case alpha         a: EgkqZPJLDywjLFQXOtllWmmWyTbPKA
-- Uppercase alpha-numeric  x: XZX38OY9MIB3JW908103VWPST2084O
-- Printable                p: =*2~&1A/By|X{9Z`f}K~NF2vkh$w?C
