declare
  
  type   nested_type is table of number;


  one_two_three    nested_type := nested_type(1,2,3);
  three_two_one    nested_type := nested_type(3,2,1);

  two_through_four nested_type := nested_type(2,3,4);

  non_distinct     nested_type := nested_type(2, 2, 3, 3, 3, 4, 4, 4, 4);

  empty_           nested_type := nested_type();


  procedure p(n nested_type) is
  begin

      for i in 1 .. n.count loop
          dbms_output.put(n(i) || ' ');
      end loop;

      dbms_output.new_line;

  end p;

begin


   p(one_two_three      multiset union            one_two_three   );
   p(one_two_three      multiset union distinct   one_two_three   );

   p(one_two_three      multiset intersect        two_through_four);
   p(one_two_three      multiset except           two_through_four);

   p(two_through_four   multiset except           one_two_three   );

   p(   set (two_through_four)                                    );
   
   p(        non_distinct                                         );
   p(   set (non_distinct    )                                    );

   dbms_output.put_line(cardinality(non_distinct));

   if 4 member of two_through_four then
      dbms_output.put_line('Yes, 4 is a member of two_through_four');
   else
      dbms_output.put_line('No, 4 is not a member of two_through_four');
   end if;

   if two_through_four is a set then
      dbms_output.put_line('two_through_four is a set');
   else
      dbms_output.put_line('two_through_four is not a set');
   end if;

   if empty_ is a set then
      dbms_output.put_line('empty_ is a set');
   else
      dbms_output.put_line('empty_ is not a set');
   end if;

   if empty_ is empty then
      dbms_output.put_line('empty_ is empty');
   else
      dbms_output.put_line('empty_ is not empty');
   end if;

end;
/
