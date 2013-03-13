create table tq84_exec_imm (
  a number,
  b number
);

insert into tq84_exec_imm values (1,2);

declare
  r tq84_exec_imm%rowtype;
begin

  execute immediate 'select * from tq84_exec_imm' into r;

  dbms_output.put_line('a: ' || r.a || ', b: ' || r.b);

end;
/


drop table tq84_exec_imm purge;
