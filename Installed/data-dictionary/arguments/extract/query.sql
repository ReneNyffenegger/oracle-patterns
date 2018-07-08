select
   case when new_item = 'new' then prc_or_fnc      end prc_or_fnc,
   case when new_item = 'new' then prc_or_fnc_name end prc_or_fnc_name,
   arg_name,
   case when arg_pos = 0 then 'RETURN' else arg_in_out end arg_in_out,
   arg_data_type,
   arg_pls_type,
   arg_type_name,
   arg_type_owner
-- case when arg_defaulted = 'Y' then 'defaulted' end defaulted
from (
select
   case when prc.subprogram_id !=
             nvl(lag(prc.subprogram_id) over (
                       order by
                          prc.subprogram_id,
                          case when arg.position = 0 then 99999999 else arg.position end),
                 0
                ) then 'new' else '' end new_item,
   case
     when arg.position is null        then 'Procedure' -- No arguments
     when arg.position = arg.sequence then 'Procedure' -- With arguments
     else                                  'Function'
   end                          prc_or_fnc,
   arg.position                 arg_pos,
   arg.sequence                 arg_seq,
   prc.procedure_name           prc_or_fnc_name,
   lag(prc.subprogram_id) over (order by prc.subprogram_id, arg.position),
   prc.subprogram_id            prc_counter,
   arg.argument_name            arg_name,
   arg.in_out                   arg_in_out,
   arg.data_type                arg_data_type,
   arg.pls_type                 arg_pls_type,
   arg.type_owner               arg_type_owner,
   arg.type_name                arg_type_name,
   arg.defaulted                arg_defaulted,
   prc.overload,
   prc.aggregate,
   prc.pipelined
from
   dba_procedures prc left join
   dba_arguments  arg on prc.owner         = arg.owner        and
                         prc.object_name   = arg.package_name and
                         prc.subprogram_id = arg.subprogram_id
where
   prc.procedure_name is not null           and
   prc.object_name = 'TQ84_FUNCS_AND_PROCS' and
   prc.owner       = 'K'
)
order by
   prc_counter,
   case when arg_pos = 0 then 99999999 else arg_pos end
;
--
-- PRC_OR_FN PRC_OR_FNC_NAME        ARG_NAME ARG_IN_OU ARG_DATA_TYPE  ARG_PLS_TYPE ARG_TYPE_NAME ARG_TYPE_OWNER
-- --------- ---------------------- -------- --------- -------------- ------------ ------------- --------------
-- Procedure PROC_NO_ARGS
-- Function  FUNC_NO_ARGS                    RETURN    NUMBER         NUMBER
-- Procedure PROC_2_ARG2            ARG1     IN        NUMBER         NUMBER
--                                  ARG2     IN        VARCHAR2       VARCHAR2
-- Function  FUNC_2_ARG2            ARG1     IN        NUMBER         NUMBER
--                                  ARG2     IN        VARCHAR2       VARCHAR2
--                                           RETURN    NUMBER         NUMBER
-- Procedure PROC_ARGS_IN_OUT       ARG1     OUT       NUMBER         NUMBER
--                                  ARG2     IN/OUT    DATE           DATE
-- Function  FUNC_ARGS_IN_OUT       ARG1     OUT       NUMBER         NUMBER
--
