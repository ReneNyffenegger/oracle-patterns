
select
  '  ' ||
-- case when not_obsolete          = 'TRUE' then '✓' else '✗' end || ' ☰ ' ||
-- status                                                         || ' ☰ ' ||
-- case when isdeprecated          = 'TRUE' then '✓' else '✗' end || ' ☰ ' ||
   case when isbasic               = 'TRUE' then '✓' else '✗' end || ' ☰ ' ||
   name                                                           || ' ☰ ' ||
   type_                                                          || ' ☰ ' ||
   default_value                                                  || ' ☰ ' ||
   description                                                    || ' ☰ ' ||
   case when isses_modifiable      = 'TRUE' then '✓' else '✗' end || ' ☰ ' ||
   case when issys_modifiable      = 'TRUE' then '✓' else '✗' end || ' ☰ ' ||
   case when ispdb_modifiable      = 'TRUE' then '✓' else '✗' end || ' ☰ ' ||
   case when isinstance_modifiable = 'TRUE' then '✓' else '✗' end
from
  parameter_view;
