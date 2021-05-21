create type tq84_number_t as table of number;
/


declare
   number_t tq84_number_t;
begin

   execute immediate
   --
   --    Note the space between `:1` and the «extend» keywoard.
   --    Without this space, a
   --      PLS-00110: bind variable '1.EXTEND' not allowed in this context
   --    error would be raised.
   --
     'begin :1 := tq84_number_t(); '      ||
     '  :1 .extend; :1(:1 .count) := 22;' ||
     '  :1 .extend; :1(:1 .count) := 33;' ||
     'end;'
   --
   --    Not the IN OUT.
   --    With an OUT only, an
   --      ORA-06537: OUT bind variable bound to an IN position
   --    will be raised.
   --
   using in out number_t;

   for i in 1 .. number_t.count loop
       dbms_output.put_line('i: ' || number_t(i));
   end loop;

end;
/

drop type tq84_number_t;
