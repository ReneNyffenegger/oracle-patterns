create table tq84_cursor_attr_test (
  a number
);

begin

  insert into tq84_cursor_attr_test select rownum from all_objects where rownum <= 10;
  dbms_output.put_line('rowcount: ' || sql%rowcount);

  insert into tq84_cursor_attr_test select * from tq84_cursor_attr_test;
  dbms_output.put_line('rowcount: ' || sql%rowcount);

  insert into tq84_cursor_attr_test select * from tq84_cursor_attr_test;
  dbms_output.put_line('rowcount: ' || sql%rowcount);

  insert into tq84_cursor_attr_test select * from tq84_cursor_attr_test;
  dbms_output.put_line('rowcount: ' || sql%rowcount);

  delete from tq84_cursor_attr_test where a = 5;
  if sql%found then
     dbms_output.put_line(sql%rowcount || ' rows where deleted');
  else
     dbms_output.put_line('no rows were deleted');
  end if;

  delete from tq84_cursor_attr_test where a = 5;
  if sql%notfound then
     dbms_output.put_line('no rows were deleted');
  else
     dbms_output.put_line(sql%rowcount || ' rows where deleted');
  end if;

  delete from tq84_cursor_attr_test where a=2;
  delete from tq84_cursor_attr_test where a=3;
  dbms_output.put_line('sql%rowcount before commit: ' || sql%rowcount);

  commit;

  dbms_output.put_line('sql%rowcount after commit: ' || sql%rowcount);

end;
/

drop table tq84_cursor_attr_test purge;
