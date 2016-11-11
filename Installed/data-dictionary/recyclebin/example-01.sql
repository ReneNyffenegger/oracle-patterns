alter session set recyclebin = on;

create table tq84_waste (
  a varchar2(4000),
  b varchar2(4000)
);

begin
  for i in 1 .. 100 loop
    insert into tq84_waste values (rpad('x', 4000, 'x'), rpad('y', 4000, 'y'));
  end loop;
end;
/

commit;

drop table tq84_waste;

select
  object_name,
  operation,
  can_undrop,
  can_purge,
  type,
  createtime,
  droptime
--dropscn
from
  user_recyclebin
where
  original_name = 'TQ84_WASTE';
--
-- OBJECT_NAME                    OPERATION CAN CAN TYPE                      CREATETIME          DROPTIME           
-- ------------------------------ --------- --- --- ------------------------- ------------------- -------------------
-- BIN$QQO3UMqKNDzgU1HeGazS5Q==$0 DROP      YES YES TABLE                     2016-11-11:11:27:31 2016-11-11:11:27:31


purge recyclebin;
