create table tq84_table_with_trigger (
  col_1  number,
  col_2  varchar2(20)
);

create trigger tq84_table_with_trigger_trg
  before insert or update on tq84_table_with_trigger
  for each row
begin
  :new.col_2 := to_char(sysdate, 'dd.mm.yyyy hh24:mi:ss');
end tq84_table_with_trigger_trg;
/

insert into tq84_table_with_trigger(col_1) values (1);
insert into tq84_table_with_trigger(col_1) values (2);

select * from tq84_table_with_trigger;


drop table tq84_table_with_trigger;
