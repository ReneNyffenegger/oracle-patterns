create table tq84_ref_cursor(
       a number,
       b varchar2(10)
);

insert into tq84_ref_cursor values (5, 'five' );
insert into tq84_ref_cursor values (4, 'four' );
insert into tq84_ref_cursor values (8, 'eight');

declare

  stmt   varchar2(3999);
  cur    sys_refcursor;

  a      number;
  b      varchar2(10);

begin

  stmt := 'select a,b from tq84_ref_cursor';

  open cur for stmt;

  loop
    fetch cur into a,b;
    exit when cur%notfound;
    dbms_output.put_line('a: ' || a || ', b: ' || b);
  end loop;

  close cur;


end;
/


drop table tq84_ref_cursor;
