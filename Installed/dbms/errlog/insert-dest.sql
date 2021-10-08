begin

   insert into tq84_dest
   select
      id,
      txt || '!',
      42/num
   from
      tq84_src
   log errors into tq84_dest_err
--
-- Log all errors:
--
   reject limit unlimited;


   insert into tq84_dest values (99, '2nd statement', 42);

end;
/
