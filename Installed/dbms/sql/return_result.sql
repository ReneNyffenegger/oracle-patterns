create table tq84_tab (
  a number,
  b varchar2(10)
);

insert into tq84_tab values (1, 'foo');
insert into tq84_tab values (1, 'bar');
insert into tq84_tab values (1, 'baz');

insert into tq84_tab values (2, 'abc'    );
insert into tq84_tab values (2, 'def ghi');
insert into tq84_tab values (2, 'jkl mno');
insert into tq84_tab values (2, 'pqrst'  );


create or replace procedure tq84_result(i number) as
  cur sys_refcursor;
begin

  open cur for select * from tq84_tab where a = i;
  dbms_sql.return_result(cur);

end tq84_result;
/

exec tq84_result(1)

exec tq84_result(2)

drop procedure tq84_result;
drop table tq84_tab purge;
