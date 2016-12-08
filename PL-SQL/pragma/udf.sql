create or replace package tq84 is
  function f     (n number) return number;
  function f_udf (n number) return number;
end tq84;
/

create or replace package body tq84 is

  function f (n number) return number is
  begin
    return n-1;
  end f;

  function f_udf (n number) return number is
    pragma udf;
  begin
    return n-1;
  end f_udf;

end tq84;
/
show errors


set timing on

--
--  Note how the answer time is faster when the pragma-udf
--  function is used.
--

select sum(tq84.f    (sysdate-created)) s from dba_objects;
-- 
--          S
-- ----------
--  402835012
-- Elapsed: 00:00:01.21

select sum(tq84.f_udf(sysdate-created)) s from dba_objects;
-- 
--          S
-- ----------
--  402835017
-- Elapsed: 00:00:00.81

select sum(tq84.f    (sysdate-created)) s from dba_objects;
-- 
--          S
-- ----------
--  402835023
-- Elapsed: 00:00:01.19

select sum(tq84.f_udf(sysdate-created)) s from dba_objects;
-- 
--          S
-- ----------
--  402835029
-- Elapsed: 00:00:00.85

select sum(tq84.f    (sysdate-created)) s from dba_objects;
-- 
--          S
-- ----------
--  402835035
-- Elapsed: 00:00:01.21

select sum(tq84.f_udf(sysdate-created)) s from dba_objects;
-- 
--          S
-- ----------
--  402835041
-- Elapsed: 00:00:00.89


drop package tq84;
