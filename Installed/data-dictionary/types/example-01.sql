create type tq84_obj as object (
   attr_1 varchar2(10),
   attr_2 number,
   attr_3 date,
   member procedure member_proc_1,
   member procedure member_proc_2,
   static procedure static_proc_1,
   static procedure static_proc_2
) not final;
/

create type body tq84_obj as

  member procedure member_proc_1 is begin null; end member_proc_1;
  member procedure member_proc_2 is begin null; end member_proc_2;

  static procedure static_proc_1 is begin null; end static_proc_1;
  static procedure static_proc_2 is begin null; end static_proc_2;

end;
/
show errors

create type tq84_obj_under_obj under tq84_obj (
  attr_4 varchar2(10),
  overriding member procedure member_proc_2
);
/
show errors;

create type body tq84_obj_under_obj as
  overriding member procedcure member_proc_2 is begin null; end member_proc_2;
end;
/


column      type_name format a20
column supertype_name format a20
select
  type_name,
  attributes,
  methods,
  final,
  supertype_name,
  incomplete
from
  user_types
where
  type_name like 'TQ84_OBJ%';
--
-- TYPE_NAME            ATTRIBUTES    METHODS FIN SUPERTYPE_NAME       INC
-- -------------------- ---------- ---------- --- -------------------- ---
-- TQ84_OBJ                      3          4 NO                       NO
-- TQ84_OBJ_UNDER_OBJ            4          5 YES TQ84_OBJ             NO

drop type tq84_obj_under_obj;
drop type tq84_obj;
