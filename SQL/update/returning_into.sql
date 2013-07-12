create table tq84_returning_into (
   a   number,
   b   varchar2(10)
);

insert into tq84_returning_into values (null, null);
insert into tq84_returning_into values (   1,'one');
insert into tq84_returning_into values (null,'two');
insert into tq84_returning_into values (   3, null);

declare
  aa    number;
begin

  update tq84_returning_into
     set a = coalesce(a, 5)  --   a = 1, so
   where b = 'one'           --   aa gets the value 1
  RETURNING a INTO aa;       --

  dbms_output.put_line(aa);

  update tq84_returning_into
     set a = coalesce(a, 7)  --   a is null, so
   where b = 'two'           --   aa get the value 7
  RETURNING a INTO aa;

  dbms_output.put_line(aa);


end;
/


drop table tq84_returning_into purge;
