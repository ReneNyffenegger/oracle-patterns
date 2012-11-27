create table tq84_dbms_scheduler_tab (
  tmstamp    date,
  text       varchar2(20)
);


create or replace package tq84_dbms_scheduler as
    procedure p;
end tq84_dbms_scheduler;
/

create or replace package body tq84_dbms_scheduler as

    procedure p is begin
        insert into tq84_dbms_scheduler_tab values (sysdate, 'p started');
        dbms_lock.sleep(10);
        insert into tq84_dbms_scheduler_tab values (sysdate, 'p stopped');

        commit;
    end p;

end tq84_dbms_scheduler;
/




begin

  dbms_scheduler.create_program (
    program_name         => 'p', 
    program_type         => 'STORED_PROCEDURE', 
    program_action       => 'tq84_dbms_scheduler.p',
    number_of_arguments  =>  0, --  Use dbms_scheduler.define_program_argument if not 0.
    enabled              =>  true,
    comments             => 'A test, just a test');

end;
/

SELECT program_name, enabled FROM user_scheduler_programs;

begin

  -- Note create_job is overloaded.
  -- This overload doesn't have the
  -- job_type parameter:

  dbms_scheduler.create_job (
    job_name             => 'p_job',
    program_name         => 'p',
    start_date           =>  null,
    repeat_interval      =>  null,
    enabled              =>  true
  );

end;
/

select 
  substrb(program_name, 1, 20) program_name,
  substrb(job_name    , 1, 20) job_name,
  enabled 
from 
  user_scheduler_jobs;

select * from tq84_dbms_scheduler_tab order by tmstamp;

prompt Going to sleep for 12 seconds

exec dbms_lock.sleep(12);
-------------------------

prompt Slept 12 seconds

select 
  substrb(program_name, 1, 20) program_name,
  substrb(job_name    , 1, 20) job_name,
  enabled 
from 
  user_scheduler_jobs;

select * from tq84_dbms_scheduler_tab order by tmstamp;

exec dbms_scheduler.drop_program('p');
drop package tq84_dbms_scheduler;
drop table tq84_dbms_scheduler_tab;
