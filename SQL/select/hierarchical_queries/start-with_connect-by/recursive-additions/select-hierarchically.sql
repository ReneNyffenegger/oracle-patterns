select
  lpad(' ',2*(level-1)) || to_char(child) s 
from
  recursive_additions 
start with
   parent is null
connect by
  prior child = parent;
