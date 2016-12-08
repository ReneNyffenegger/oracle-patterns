create or replace package tq84 is
  function f     (n number) return number;
  function f_udf (n number) return number;
end tq84;
/

create or replace package body tq84 is

  function f (n number) return number is
  begin
    return n;
  end f;

  function f_udf (n number) return number is
    pragma udf;
  begin
    return n;
  end f_udf;

end tq84;
/
show errors


set timing on

select sum(tq84.f    (sysdate-created)) from dba_objects;
select sum(tq84.f_udf(sysdate-created)) from dba_objects;

select sum(tq84.f    (sysdate-created)) from dba_objects;
select sum(tq84.f_udf(sysdate-created)) from dba_objects;

select sum(tq84.f    (sysdate-created)) from dba_objects;
select sum(tq84.f_udf(sysdate-created)) from dba_objects;

drop package tq84;
