create or replace package tq84_pck as -- {

  procedure p;

end tq84_pck; -- }
/

create or replace package body tq84_pck as -- {

  procedure p is -- {
  begin

    $IF $$TQ84_BOOL $THEN
        dbms_output.put_line('hello, world. The num is: '   || $$TQ84_NUM);
    $ELSE
        dbms_output.put_line('good bye, world. The num is ' || $$TQ84_NUM);
    $END

  end p; -- }

end tq84_pck; -- }
/

exec tq84_pck.p
-- good bye, world. The num is

column plsql_code_type        format a15
column plsql_debug            format a15
column plsql_warnings         format a15
column nls_length_semantics   format a15
column plsql_ccflags          format a25
column plscope_settings       format a16

select
  plsql_optimize_level,
  plsql_code_type,
  plsql_debug,
  plsql_warnings,
  nls_length_semantics,
  plsql_ccflags,
  plscope_settings
from
  user_plsql_object_settings
where
  type = 'PACKAGE BODY' and
  name = 'TQ84_PCK';
--
-- PLSQL_OPTIMIZE_LEVEL PLSQL_CODE_TYPE PLSQL_DEBUG     PLSQL_WARNINGS  NLS_LENGTH_SEMA PLSQL_CCFLAGS             PLSCOPE_SETTINGS
-- -------------------- --------------- --------------- --------------- --------------- ------------------------- ----------------
--                    2 INTERPRETED     FALSE           DISABLE:ALL     CHAR                                      IDENTIFIERS:NONE



alter session set plsql_ccflags='TQ84_BOOL:TRUE';
select substrb(value, 1, 50) val from v$parameter where name = 'plsql_ccflags';
-- VAL
-- --------------------------------------------------
-- TQ84_BOOL:TRUE

select
  plsql_optimize_level,
  plsql_code_type,
  plsql_debug,
  plsql_warnings,
  nls_length_semantics,
  plsql_ccflags,
  plscope_settings
from
  user_plsql_object_settings
where
  type = 'PACKAGE BODY' and
  name = 'TQ84_PCK';
--
-- PLSQL_OPTIMIZE_LEVEL PLSQL_CODE_TYPE PLSQL_DEBUG     PLSQL_WARNINGS  NLS_LENGTH_SEMA PLSQL_CCFLAGS             PLSCOPE_SETTINGS
-- -------------------- --------------- --------------- --------------- --------------- ------------------------- ----------------
--                    2 INTERPRETED     FALSE           DISABLE:ALL     CHAR                                      IDENTIFIERS:NONE

alter package tq84_pck compile;

select
  plsql_optimize_level,
  plsql_code_type,
  plsql_debug,
  plsql_warnings,
  nls_length_semantics,
  plsql_ccflags,
  plscope_settings
from
  user_plsql_object_settings
where
  type = 'PACKAGE BODY' and
  name = 'TQ84_PCK';
--
-- PLSQL_OPTIMIZE_LEVEL PLSQL_CODE_TYPE PLSQL_DEBUG     PLSQL_WARNINGS  NLS_LENGTH_SEMA PLSQL_CCFLAGS             PLSCOPE_SETTINGS
-- -------------------- --------------- --------------- --------------- --------------- ------------------------- ----------------
--                    2 INTERPRETED     FALSE           DISABLE:ALL     CHAR            TQ84_BOOL:TRUE            IDENTIFIERS:NONE


exec tq84_pck.p
-- hello, world. The num is:

alter session set plsql_ccflags='TQ84_NUM:42';
alter package tq84_pck compile;
exec tq84_pck.p
-- good bye, world. The num is 42

drop package tq84_pck;
