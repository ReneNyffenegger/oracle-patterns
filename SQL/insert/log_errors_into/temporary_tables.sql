create table tq84_source (
   a number,
   b varchar2(10),
   c varchar2(10)
);

create global temporary table tq84_dest (
   a number,
   b varchar2(10),
   c varchar2(10),
   --
   constraint tq84_dest_pk primary key (a, b)
) on commit delete rows;

begin

  dbms_errlog.create_error_log (

    dml_table_name     => 'tq84_dest',
    err_log_table_name => 'tq84_dest_err'

  );

end;
/


insert into tq84_source values (1, 'one'  , 'foo'  );
insert into tq84_source values (2, 'two'  , 'bar'  );
insert into tq84_source values (2, 'two'  , 'bar++');
insert into tq84_source values (3, 'three', 'baz'  );

prompt

begin

  for r in (select * from tq84_source) loop

      begin

         insert into tq84_dest values r
           log errors into tq84_dest_err;

      exception when dup_val_on_index then

         if sqlerrm like '%TQ84_DEST_PK%' then
          
            dbms_output.put_line('Primary key violated, find details in tq84_dest_err');

         end if;

      end;

  end loop;

end;
/


-- Commit empties tq84_dest (because it is a global
-- temporary table):
commit;
select * from tq84_dest;

-- ... but does not empty err table (which is not a
-- global temporary table)
select
  substrb(ora_err_mesg$, 1, 70) err_msg,
  substrb(a            , 1, 10) a,
  substrb(b            , 1, 20) b,
  substrb(c            , 1, 20) c
from
  tq84_dest_err;


drop table tq84_source    purge;
drop table tq84_dest      purge;
drop table tq84_dest_err  purge;
