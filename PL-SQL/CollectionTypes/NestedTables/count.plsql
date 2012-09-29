create type tq84_number_tab as table of number;
/


declare

  numbers tq84_number_tab := tq84_number_tab(1, 2, 3, 4, 5);

begin

  -- count is evaluated once, at the beginning
  -- of the loop.
  for i in 1 .. numbers.count loop

      dbms_output.put_line(numbers(i));

      numbers.extend;
      numbers(numbers.count) := numbers.count;

      exit when i > 100;

  end loop;

end;
/


drop type tq84_number_tab;
