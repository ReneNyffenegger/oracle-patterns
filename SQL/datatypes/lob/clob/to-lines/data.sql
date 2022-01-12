insert into tq84_text values (1,
q'{First line
second line
third line
}');

insert into tq84_text values (2,
q'{foo
bar
baz}');

declare
   c clob;
begin

   dbms_lob.createtemporary(c, false);

   for i in 1 .. 10 loop

       dbms_lob.append(c, to_char(i, 'fm9999') || ': ' || lpad('.', 4000, '.') || case when mod(i,2) = 0 then chr(13) end || chr(10));

   end loop;

   insert into tq84_text values (3, c);

end;
/

