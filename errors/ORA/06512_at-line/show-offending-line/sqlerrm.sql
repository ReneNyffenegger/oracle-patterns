begin
   tq84_err_test.go;
exception when others then
   dbms_output.put_line(sqlerrm);
end;
/
--
-- ORA-20888: Raising errors is easier than raising money
