declare

  territories utl_i18n.string_array;
  terrNo     number;

begin

  territories := utl_i18n.get_local_territories('German');

  terrNo := territories.first;
  while terrNo is not null loop
      dbms_output.put_line(terrNo || ': ' || initcap(territories(terrNo)));
      terrNo := territories.next(terrNo);
  end loop;

end;
/
-- 0: Germany
-- 1: Austria
-- 2: Luxembourg
-- 3: Switzerland
