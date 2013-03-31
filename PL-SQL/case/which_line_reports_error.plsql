create or replace package tq84_case as

  procedure d;

end tq84_case;
/

create or replace package body tq84_case as

  procedure d as
    a number := 4;
    b number := 3;
  begin


    case a when 1 then output.print('a = 1'); -- Line 9
           when 2 then output.print('a = 2');
           when 3 then output.print('a = 3');
           when 4 then case b
                       when 1 then output.print('b = 1');
                       when 2 then output.print('b = 2');
                       end case;

    end case;

  end d;

end tq84_case;
/


--   Which line is reported as having an error?
exec tq84_case.d
