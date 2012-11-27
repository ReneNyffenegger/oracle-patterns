create table tq84_dbms_scheduler_job_t (
  tmstamp    date,
  text       varchar2(20)
);


create or replace package tq84_dbms_scheduler_job_p as

    procedure j;

end tq84_dbms_scheduler_job_p;
/

create or replace package body tq84_dbms_scheduler_job_p as

    procedure j is begin

        insert into tq84_dbms_scheduler_job_t values (sysdate, 'j started');
        dbms_lock.sleep(10);
        insert into tq84_dbms_scheduler_job_t values (sysdate, 'j stopped');

        commit;
    end j;

end tq84_dbms_scheduler_job_p;
/


begin

  dbms_scheduler.create_job (
    job_name             => 'TheNameOfTheJob',
    job_type             => 'STORED_PROCEDURE',
    job_action           => 'tq84_dbms_scheduler_job_p.j',
    start_date           =>  null,
    repeat_interval      =>  null,
    enabled              =>  true
  );

end;
/

select 
 substrb(program_name, 1, 20) program_name, 
 enabled 
from 
  user_scheduler_jobs;

select * from tq84_dbms_scheduler_job_t order by tmstamp;

prompt going to sleep for 12 seconds
exec dbms_lock.sleep(12);
------------------------------------------
prompt slept 12 seconds

select 
 substrb(program_name, 1, 20) program_name, 
 enabled 
from 
  user_scheduler_jobs;

select * from tq84_dbms_scheduler_job_t order by tmstamp;

drop package tq84_dbms_scheduler_job_p;
drop table tq84_dbms_scheduler_job_t;
