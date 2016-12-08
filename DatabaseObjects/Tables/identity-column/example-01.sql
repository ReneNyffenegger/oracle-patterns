create table tq84_identity (
  id  number generated as identity,
  txt varchar2(10)
);

insert into tq84_identity (txt) values ('one'  );
insert into tq84_identity (txt) values ('two'  );
insert into tq84_identity (txt) values ('three');
insert into tq84_identity (txt) values ('four' );
insert into tq84_identity (txt) values ('five' );

declare
    id_generated number;
begin
    insert into tq84_identity (txt) values ('six'  ) returning id into id_generated;
    dbms_output.put_line('id_generated: ' || id_generated);
 -- id_generated: 6
end;
/

select * from tq84_identity;
-- 
--         ID TXT
-- ---------- ----------
--          1 one
--          2 two
--          3 three
--          4 four
--          5 five
--          6 six

drop table tq84_identity purge;
