create table tq84_select_from_table (
  a number,
  b varchar2(42),
  c date
);

insert into tq84_select_from_table values (   42, 'fourty-two', sysdate    );
insert into tq84_select_from_table values (    5, 'minus 5'   ,'2005-05-05');
insert into tq84_select_from_table values ( null, '#'         , null       );
insert into tq84_select_from_table values (   10,  null       , sysdate + 1);

declare
--sql_stmt   varchar2(32000) := 'select a, b, c from tq84_select_from_table';

  c          number;
--cntCols    number;
--cols       dbms_sql.desc_tab;

  a_         number;
  b_         varchar2(42);
  c_         date;

  dummy      number;

begin

  c := dbms_sql.open_cursor;

  dbms_sql.parse(c, 'select a,b,c from tq84_select_from_table where a >= :a', dbms_sql.native);

  dbms_sql.bind_variable(c, ':a', 7);

  dbms_sql.define_column(c, 1, a_    );
  dbms_sql.define_column(c, 2, b_, 42);
  dbms_sql.define_column(c, 3, c_    );

  dummy := dbms_sql.execute(c);


  while dbms_sql.fetch_rows(c) > 0 loop

    dbms_sql.column_value(c, 1, a_);
    dbms_sql.column_value(c, 2, b_);
    dbms_sql.column_value(c, 3, c_);

    dbms_output.new_line;

    dbms_output.put_line('a: ' || a_);
    dbms_output.put_line('b: ' || b_);
    dbms_output.put_line('c: ' || c_);

  end loop;

  dbms_sql.close_cursor(c);

  dbms_output.new_line;

end;
/

drop table tq84_select_from_table purge;
