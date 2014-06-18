create table tq84_rowcount (a number);

insert into tq84_rowcount values (  42);
insert into tq84_rowcount values (  12);
insert into tq84_rowcount values (1000);


declare
  
   cursor c is select * from tq84_rowcount;

begin

  for r in c loop

      dbms_output.put_line(to_char(r.a, '9999') || ' ' || c%rowcount);

  end loop;

end;
/

drop table tq84_rowcount purge;
