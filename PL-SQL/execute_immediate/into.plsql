create table tq84_exec_imm (
  a number,
  b number
);

insert into tq84_exec_imm values (1,2);

declare
  a number;
  b number;
begin

  execute immediate 'select a, b from tq84_exec_imm' into a, b;

  dbms_output.put_line('a: ' || a || ', b: ' || b);

end;
/


drop table tq84_exec_imm purge;
