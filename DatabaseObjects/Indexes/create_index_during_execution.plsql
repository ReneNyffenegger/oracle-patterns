--
--  This file and the perl script create_index_during_execution.pl is
--  used to demonstrated that an index can be built while a PL/SQL
--  package accesses a table on which the index should be used.
--
--  First, the table tq84_1000000 is createed and filled with 1000000
--  records. Then the package tq84_1000000 iterates 51 times and
--  selects a specific record from the table. After 4 or so selects
--  it writes into a pipe that the index should now be built. This
--  is the perl script's part: it waits for the message on the pipe
--  and as soon as the message arrives, it creates the index.
--
--  While the plsql package iterates and selects from the table,
--  it prints (dbms_output) how long it took to select for each
--  statement. These times should go down dramatically as soon
--  as the index is built.
--
--  Start the perl script first, then run this file in SQL*Plus.
--
create table tq84_1000000 (
  num    number,
  text   varchar2(1000)
);


begin

  for i in 1 .. 1000000 loop

      insert into tq84_1000000 values (
        i,
        to_char(date '-4712-01-01' + i-1, 'jsp')
      );

  end loop;

end;
/

commit;

-- select count(*) from tq84_1000000;
-- select * from tq84_1000000 where num = 555555;

create package tq84_index_during_exec as

    procedure main;

end tq84_index_during_exec;
/


create package body tq84_index_during_exec as

   procedure main is
       v_num number;

       v_start_time number;

   begin

       for i in 0 .. 50 loop

           
           v_start_time := dbms_utility.get_time;

           select num into v_num
             from tq84_1000000
            where text = 'five hundred fifty-five thousand five hundred fifty-five';

           dbms_output.put_line('select took: ' || (dbms_utility.get_time - v_start_time) / 100 || ' secs');

           if i = 3 then

              declare
                status number;
              begin
                sys.dbms_pipe.pack_message('create index now');
                status := sys.dbms_pipe.send_message('index_during_exec');
              end;

           end if;

       end loop;

   end main;

end tq84_index_during_exec;
/

show errors


set timing on

exec tq84_index_during_exec.main

set timing off


drop package tq84_index_during_exec;

--drop index tq84_1000000_ix;
drop table tq84_1000000 purge;
