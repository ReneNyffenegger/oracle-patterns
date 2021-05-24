select
  'drop ' || obj.object_type || ' ' || obj.object_name || ';' stmt
-- obj.created
from
   all_objects           obj     left join
   all_tab_identity_cols idc on obj.object_type = 'SEQUENCE'        and
                                obj.object_name = idc.sequence_name and
                                obj.owner       = idc.owner
where
-- object_name not like 'X'               and
-- object_name     like 'Y'               and
   obj.object_type not in ('INDEX', 'PACKAGE BODY', 'TYPE BODY', 'LOB') and
   idc.sequence_name is  null                                           and -- exclude sequences of identity columns
   obj.owner = user
order by
   obj.created desc
--  object_name
;
