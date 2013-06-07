--
--    Selects can't select booleans.
--

create function tq84_return_boolean (a number) return boolean as
begin

    if mod(a,3)  = 0 then
       return true;
    end if;
    
    return false;

end tq84_return_boolean;
/

create table tq84_boolean_test (
       col_1 number
);

insert into tq84_boolean_test values (1);
insert into tq84_boolean_test values (2);
insert into tq84_boolean_test values (3);
insert into tq84_boolean_test values (4);
insert into tq84_boolean_test values (5);

--
--        ORA-06553: PLS-382: expression is of wrong type
--
select
  col_1,
  tq84_return_boolean(col_1)  -- ORA-06553: PLS-382: expression is of wrong type
from
  tq84_boolean_test;


create function tq84_convert_boolean(b in boolean) return number as
begin

     if b then return 1; end if;
     
     return 0;
end tq84_convert_boolean;
/


select
  col_1,
  sys.diutil.bool_to_int(tq84_return_boolean(col_1)) -- ORA-06553: PLS-382: expression is of wrong type
from
  tq84_boolean_test;

drop table    tq84_boolean_test;
drop function tq84_return_boolean;
