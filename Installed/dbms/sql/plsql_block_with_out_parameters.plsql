declare

  block      varchar2(32000) := 'begin :out_1 := :in_1 * :in_2; :out_2 := :in_1 + :in_3; end;';

  v_dummy    number;

  c          number;

  out_1      number;
  out_2      number;

begin

  c := dbms_sql.open_cursor;

  dbms_sql.parse(c, block, dbms_sql.native);

  dbms_sql.bind_variable(c, 'in_1', 9);
  dbms_sql.bind_variable(c, 'in_2', 4);
  dbms_sql.bind_variable(c, 'in_3', 7);

  dbms_sql.bind_variable(c, 'out_1', cast (null as number));
  dbms_sql.bind_variable(c, 'out_2', cast (null as number));

  v_dummy := dbms_sql.execute(c);

  dbms_sql.variable_value(c, 'out_1', out_1);
  dbms_sql.variable_value(c, 'out_2', out_2);

  dbms_sql.close_cursor(c);

  dbms_output.new_line;

  dbms_output.put_line('out_1: ' || out_1);
  dbms_output.put_line('out_2: ' || out_2);

  dbms_output.new_line;

end;
/
