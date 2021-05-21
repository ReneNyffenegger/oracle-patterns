create table tq84_exec_immediate_test (
   id  number generated always as identity,
   num number,
   txt varchar2(20)
);

declare
   inserted_id    number;
   inserted_rowid rowid;
begin
   execute immediate
    q'{insert into tq84_exec_immediate_test
        (num, txt) values
        (:1 , :2 )
       returning
         id, rowid    into :3, :4
      }'
   using
       in  42         ,     'fourty-two',
       out inserted_id, out inserted_rowid;

   dbms_output.put_line('inserted id:    ' || inserted_id);
   dbms_output.put_line('inserted rowid: ' || inserted_rowid);

end;
/

select * from tq84_exec_immediate_test;

drop  table tq84_exec_immediate_test;
rollback;
