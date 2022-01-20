begin
   tq84_err_test.go;
exception when others then
   dbms_output.put_line(sqlerrm);
end;
/
