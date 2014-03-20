--
--
--    Script to demonstrate that primary key violations
--    are not handled by the «log errors into» clause.
--
--


create table tq84_source (
   a number,
   b varchar2(10),
   c varchar2(10)
);

create table tq84_dest (
   a number,
   b varchar2(10),
   c varchar2(10)
);

alter table tq84_dest add constraint tq84_dest_pk primary key (a, b);


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
prompt
prompt     Without "log errors into ..."
prompt     =============================
prompt

insert into tq84_dest select * from tq84_source /* ORA-00001: unique constraint (SPEZMDBA.TQ84_DEST_PK) violated */;

select * from tq84_dest empty; 


prompt
prompt
prompt     With "log errors into ..."
prompt     ==========================
prompt
insert into tq84_dest select * from tq84_source /* ORA-00001: unique constraint (SPEZMDBA.TQ84_DEST_PK) violated */
  log errors into tq84_dest_err;

select * from tq84_dest empty; 

drop table tq84_source    purge;
drop table tq84_dest      purge;
drop table tq84_dest_err  purge;
