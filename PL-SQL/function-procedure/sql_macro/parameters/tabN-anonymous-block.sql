declare

   procedure iterateWithVariable(n integer) is
   begin
       for r in (select txt from tabN(n)) loop
           dbms_output.put_line(r.txt);
       end loop;
   end iterateWithVariable;

begin

   for r in (select txt from tabN(1)) loop
       dbms_output.put_line(r.txt);
   end loop;

   for r in (select txt from tabN(2)) loop
       dbms_output.put_line(r.txt);
   end loop;

   iterateWithVariable(1);
   iterateWithVariable(2);

end;
/
