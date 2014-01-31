--
--    Determine the triggering SQL statement
--    within a trigger.
--

create table tq84_get_dml (
   a  number,
   b  varchar2(10)
);

create table tq84_get_dml_log (
  dml varchar2(1000)
);

create trigger tq84_get_dml_trg_ins
  before insert or update on tq84_get_dml
  for each row
declare
  dml varchar2(1000);
begin


    select
      sq.sql_text
    into
      dml
    from
      v$open_cursor cu                           join
      v$session     se   on cu.saddr  = se.saddr join
      v$sql         sq   on cu.sql_id = sq.sql_id
    where
      se.sid = sys_context('USERENV', 'SID') and
      cu.sql_exec_id is not null and
      cu.sql_id != (select sq.sql_id 
                      from v$sql sq join
                           v$session se on sq.address    = se.sql_address and
                                           sq.hash_value = se.sql_hash_value

                       where
                          se.sid = sys_context('USERENV', 'SID')
                    );


    insert into tq84_get_dml_log values (dml);



end tq84_get_dml_trg_ins;
/

show errors trigger tq84_get_dml_trg_ins


insert into tq84_get_dml values (1, 'foo');

select * from tq84_get_dml_log;


drop table tq84_get_dml     purge;
drop table tq84_get_dml_log purge;
