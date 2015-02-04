declare

  datapump_job number;
  job_state    varchar2(20);

begin

  datapump_job := dbms_datapump.open(
    operation    => 'IMPORT',
    job_mode     => 'SCHEMA',
    remote_link  =>  null,
    job_name     => 'Clone schema A, import',
    version      => 'LATEST',
    compression  =>  dbms_datapump.ku$_compress_metadata
  );

  dbms_output.put_line('datapump_job: ' || datapump_job);

  dbms_datapump.metadata_remap(datapump_job,'REMAP_SCHEMA','FROM_SCHEMA_A','TO_SCHEMA_A');

  dbms_datapump.add_file(
    handle    =>  datapump_job,
    filename  => 'clone_schema_a_import.log',
    directory => 'DATAPUMP_DIR',
    filetype  =>  dbms_datapump.ku$_file_type_log_file);

  dbms_datapump.add_file(
    handle    =>  datapump_job,
    filename  => 'clone_schema_a.dmp', -- Note: export has created the file with UPPERCASE letters
    directory => 'DATAPUMP_DIR',
    filetype  =>  dbms_datapump.ku$_file_type_dump_file);

  dbms_datapump.start_job   (datapump_job);
  dbms_datapump.wait_for_job(datapump_job, job_state);

  dbms_output.put_line('Job state: ' || job_state);

  dbms_datapump.detach(datapump_job);

--exception when others then
--
--  dbms_output.put_line(sqlcode);
--  dbms_output.put_line(sqlerrm);
--
--  if datapump_job is not null then
--     dbms_datapump.detach(datapump_job);
--  end if;

end;
/
$dir c:\temp\clone*
