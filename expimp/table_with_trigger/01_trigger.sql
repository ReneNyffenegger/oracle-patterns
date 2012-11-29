create  trigger tq84_table_with_trigger_trg 
before insert
   on tq84_table_with_trigger
   for each row
begin

   :new.col_2 := to_char(sysdate, 'hh24:mi:ss');

end tq84_table_with_trigger_trg;
/
