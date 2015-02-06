    dbms_output.put_line(sqlcode);
    dbms_output.put_line(sqlerrm);

    declare
      status_ ku$_status1010;
    begin


    dbms_datapump.get_status(
      handle     => datapump_job,
      mask       => dbms_datapump.ku$_status_job_error,
      timeout    => 0,
      job_state  => job_state,
      status     => status_
    );

    for i in 1 .. status_.error.count loop
        dbms_output.put_line(status_.error(i).logtext);
    end loop;
  
    if datapump_job is not null then
       dbms_datapump.detach(datapump_job);
    end if;

    end;

