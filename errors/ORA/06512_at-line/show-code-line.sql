begin

   tq84_err_test.go;

exception when others then

   declare
      stack            varchar2(4000); -- is 2000 sufficient?
      err_line         varchar2( 200);

      fully_qualif_obj varchar2( 300);
      obj_owner        varchar2( 128);
      plsql_obj        varchar2( 128);
      src_line         number  (   6);
   begin
      stack := dbms_utility.format_error_backtrace;

      err_line := regexp_substr(stack, 'ORA-06512: at [^' || chr(10) || ']+', 1, 1, 'n');

--    dbms_output.put_line('err_line: ' || err_line);

      fully_qualif_obj := regexp_replace(err_line, 'ORA-06512: at "(.*)", line \d+', '\1');
--    dbms_output.put_line('fully_qualif_obj: ' || fully_qualif_obj);

      obj_owner        := regexp_replace(fully_qualif_obj, '([^.]+).*', '\1');
--    dbms_output.put_line('obj_owner       : ' || obj_owner);

      plsql_obj        := regexp_replace(fully_qualif_obj, '[^.]+\.(.*)', '\1');
--    dbms_output.put_line('plsql_obj       : ' || plsql_obj);

      src_line         := regexp_replace(err_line, 'ORA-06512: at ".*", line (\d+)', '\1');
--    dbms_output.put_line('src_line        : ' || src_line);

      dbms_output.new_line;
      dbms_output.put_line('Exception was caused by the following line');
      dbms_output.new_line;
      for code in (select
            text
         from
            dba_source
         where
            owner =     obj_owner and
            name  =     plsql_obj and
            line  =     src_line  and
            type  like '%BODY') loop

         dbms_output.put_line(code.text);

      end loop;

   end;
end;
/

