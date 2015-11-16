begin -- { Creating program, schedule and job

  dbms_scheduler.create_program (
    program_name         => 'FOO_PROG', 
    program_type         => 'STORED_PROCEDURE', 
    program_action       => 'tq84_pkg.proc',
    number_of_arguments  =>  0, --  Use dbms_scheduler.define_program_argument if not 0.
    enabled              =>  true,
    comments             => 'Scheduling example'
  );
  -- select enabled from user_scheduler_programs where program_name = 'FOO_PROG';

  dbms_scheduler.create_schedule (
    schedule_name   => 'FOO_SCHEDULE',
    start_date      =>  systimestamp,
    repeat_interval => 'freq=minutely; bysecond=30',
    end_date        =>  null,
    comments        => 'Minute Schedule'
  );
  -- select start_date, repeat_interval, end_date from user_scheduler_schedules where schedule_name = 'FOO_SCHEDULE';

  dbms_scheduler.create_job (
    job_name      => 'FOO_JOB',
    program_name  => 'FOO_PROG',
    schedule_name => 'FOO_SCHEDULE',
    enabled       =>  true,
    comments      => 'Job, combining FOO_SCHEDULE with FOO_PROG'
);
  -- select enabled from user_scheduler_jobs where job_name = 'FOO_JOB';

  -- select log_id, log_date, status from user_scheduler_job_log where job_name = 'FOO_JOB';

end; -- }
/
