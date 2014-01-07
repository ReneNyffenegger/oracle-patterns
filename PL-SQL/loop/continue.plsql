begin


  for i in 1 .. 5 loop

      dbms_output.put_line('i: ' || i || '   ');

      for j in 1 .. 5 loop

          dbms_output.put_line('    j: ' || j);

          continue when i+j > 7;

          dbms_output.put_line('*');



      end loop;

  end loop;


  dbms_output.put_line('x');


end;
/
