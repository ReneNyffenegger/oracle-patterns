declare

  procedure go(text in varchar2) is begin -- {

      dbms_output.put_line(text || ', trying to create job.');
      
      dbms_scheduler.create_job (
        job_name             => 'TheNameOfTheJob',
        job_type             => 'PLSQL_BLOCK',
        job_action           => 'begin dbms_lock.sleep(5); end;',
        start_date           =>  null,
        repeat_interval      =>  null,
        enabled              =>  true
      );

      dbms_output.put_line(text || ', job created');

  exception when others then

      if sqlcode = -27477 then

         dbms_output.put_line(text || ', job was started before previous ended');

      end if;

  end go; -- }

begin


  go('first');
  go('second');
  dbms_lock.sleep(7);
  go('third');

end;
/
