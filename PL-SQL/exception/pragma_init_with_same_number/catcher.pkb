create or replace package body tq84_catcher as

    procedure go is 
    begin

        tq84_thrower_1.go;

    exception
      
      when tq84_thrower_2.exc then
      --
      --   Note, tq84_thrower_2.exc is caught, altough, technically,
      --         tq84_thrower_1.exc is thrown. This is because
      --         both exception share the same errcode (-20777)
      --
           dbms_output.put_line('caught tq84_thrower_2.exc, sqlerrm: ' || sqlerrm);
           
      when others             then
           dbms_output.put_line('caught other, sqlerrm: ' || sqlerrm);
        
    end go;

end tq84_catcher;
/
