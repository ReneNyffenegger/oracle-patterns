begin
   tq84_err_test.go;
exception when others then
   dbms_output.put_line(dbms_utility.format_error_backtrace);
end;
/
--
-- ORA-06512: at "RENE.TQ84_ERR_TEST", line 5
-- ORA-06512: at "RENE.TQ84_ERR_TEST", line 10
-- ORA-06512: at "RENE.TQ84_ERR_TEST", line 15
-- ORA-06512: at "RENE.TQ84_ERR_TEST", line 20
-- ORA-06512: at line 2
