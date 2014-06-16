
create table tq84_power (n number);

insert into tq84_power values (-5  );
insert into tq84_power values (-3.2);
insert into tq84_power values ( 0  );
insert into tq84_power values (+2  );
insert into tq84_power values (+4.7);

begin

   for base     in (select n from tq84_power) loop
   for exponent in (select n from tq84_power) loop


       declare
         r number;
       begin
        
         r := power(base.n, exponent.n);

       exception when value_error then

       -- base and exponent can be any number, except
       --
       --   if base = 0 then exponent must not be negative
       --   if bsae < 0 then exponent must be integer

          dbms_output.put_line('base: ' || to_char(base.n, '99.00') || '   exponent: ' || to_char(exponent.n, '99.00'));

       end;

   end loop; end loop;


end;
/

drop table tq84_power purge;
