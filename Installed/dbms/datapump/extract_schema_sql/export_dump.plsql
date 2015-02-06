declare

  datapump_job number;
  job_state    varchar2(20);

begin

  datapump_job := dbms_datapump.open(
    operation    => 'EXPORT',
    job_mode     => 'SCHEMA',
    remote_link  =>  null,
    job_name     => 'Export dump file',
    version      => 'LATEST'
  );

  dbms_output.put_line('datapump_job: ' || datapump_job);


  dbms_datapump.add_file(
    handle    =>  datapump_job,
    filename  => 'export.dmp',
    directory => 'DATAPUMP_DIR',
    filetype  =>  dbms_datapump.ku$_file_type_dump_file);


  dbms_datapump.start_job(
    handle       => datapump_job,
    skip_current => 0,
    abort_step   => 0);

  dbms_datapump.wait_for_job(datapump_job, job_state);

  dbms_output.put_line('Job state: ' || job_state);

  dbms_datapump.detach(datapump_job);

  exception when others then

@@dbms_datapump_exception.plsql
  
end;
/
