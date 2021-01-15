create table tab_with_id (
   txt  varchar2(20),
   id   integer generated always as identity
);

declare

   procedure ins(t varchar2) is
      inserted_id pls_integer;
   begin
      insert into tab_with_id (txt) values (t) returning id into inserted_id;
      dbms_output.put_line(t || ' was inserted with id ' || inserted_id);
   end ins;

begin
   ins('foo');
   ins('bar');
   ins('baz');
end;
/

drop table tab_with_id;
