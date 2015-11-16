begin -- { Cleaning up

  begin
    dbms_scheduler.drop_job      ('FOO_JOB'     );
  exception when others then
     if sqlcode != -27475 then
  --
  -- Exception -27475 is raised if job does not exist.
  -- Do nothing if job does not exists, else
  -- raise error
  --
        raise;
     end if;
  end;

  begin
    dbms_scheduler.drop_schedule ('FOO_SCHEDULE');
  exception when others then
     if sqlcode != -27476 then
     -- Similar logic as above
        raise;
     end if;
  end;

  begin
    dbms_scheduler.drop_program  ('FOO_PROGRAM' );
  exception when others then
     if sqlcode != -27476 then
     -- Similar logic as above
        raise;
     end if;
  end;

end; -- }
/

drop table    tq84_table;
drop package  tq84_pkg;
