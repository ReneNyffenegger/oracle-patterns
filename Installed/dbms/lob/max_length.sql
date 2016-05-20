create table tq84_max_length_clob (
  i number,
  c clob
);

declare
  vc varchar2(32767);

  cl clob;
begin
  
  vc := lpad('x', 32767, 'x');

  insert into tq84_max_length_clob values (1, vc);
  insert into tq84_max_length_clob values (2, empty_clob()) returning c into cl;

  for i in 1 .. 1000 loop

      dbms_lob.append(cl, lpad('y', 100, 'y'));

  end loop;

end;
/


select i, length(c) from tq84_max_length_clob;

set long 100000

select c from tq84_max_length_clob where i = 1;

select c from tq84_max_length_clob where i = 2;

drop table tq84_max_length_clob;
