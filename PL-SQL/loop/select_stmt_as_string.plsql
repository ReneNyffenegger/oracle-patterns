--
--     An SQL Select statement as a string.
--
--     Looping over its result set.
--


create table tq84_loop_ex (
   n number,
   v varchar2(10)
);

insert into tq84_loop_ex values (1, 'one'  );
insert into tq84_loop_ex values (2, 'two'  );
insert into tq84_loop_ex values (3, 'three');


declare

  type cur_t is ref cursor;
  cur  cur_t;

  rec  tq84_loop_ex%rowtype;

  stmt varchar2(100) := 'select n, v from tq84_loop_ex';
  
begin

  open cur for stmt; 
  
  loop

       fetch cur into rec;
       exit when cur%notfound;

       dbms_output.put_line(rec.n || ', ' || rec.v);

  end loop;
  
  close cur;

end;
/


drop table tq84_loop_ex purge;
