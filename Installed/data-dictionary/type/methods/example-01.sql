create type tq84_obj as object (
  dummy date,
        member procedure proc_1,
        static procedure proc_2,
        member function  func_1 return number,
  final member function  func_2 return varchar2
);
/

create type body tq84_obj as
        member procedure proc_1 is begin null;  end proc_1;
        static procedure proc_2 is begin null;  end proc_2;
        member function  func_1 return number   is begin return null; end func_1;
  final member function  func_2 return varchar2 is begin return null; end func_2;
end;
/
show errors;

column method_name format a10
select
  method_name,
  method_type,
  parameters,
  final,
  instantiable
from
  user_type_methods
where
  type_name = 'TQ84_OBJ'
order by
  method_no;
--
-- METHOD_NAM METHOD PARAMETERS FIN INS
-- ---------- ------ ---------- --- ---
-- PROC_1     PUBLIC          1 NO  YES
-- PROC_2     PUBLIC          0 NO  YES
-- FUNC_1     PUBLIC          1 NO  YES
-- FUNC_2     PUBLIC          1 YES YES

drop type tq84_obj;
