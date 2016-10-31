create type tq84_coll_obj as object (
  dummy number
);
/

create type tq84_coll_tab    as table of tq84_coll_obj;
/

create type tq84_coll_var    as varying array (1000) of tq84_coll_obj;
/

create type tq84_coll_var_nn as varying array (1000) of tq84_coll_obj not null;
/

select
  type_name,
  coll_type,
  elem_type_name,
--elem_type_owner
  nulls_stored
from
  user_coll_types
where
  type_name like 'TQ84_COLL%';


drop type tq84_coll_var_nn;
drop type tq84_coll_var;
drop type tq84_coll_tab;
drop type tq84_coll_obj;
