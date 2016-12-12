declare
  v varchar2(100);
begin


  dbms_output.new_line;

  for c in (
    select 'dbms_stats.add_global_prefs'    n from dual union all
    select 'dbms_stats.auto_cascade'        n from dual union all
    select 'dbms_stats.auto_degree'         n from dual union all
    select 'dbms_stats.auto_invalidate'     n from dual union all
    select 'dbms_stats.auto_sample_size'    n from dual union all
    select 'dbms_stats.purge_all'           n from dual union all
    select 'dbms_stats.reclaim_synopsis'    n from dual 
  ) loop

    begin
      execute immediate q'!
        declare
          function tc (b boolean ) return varchar2 is begin if b is null then return 'null'; elsif b then return 'true'; else return 'false'; end if; end;
          function tc (c varchar2) return varchar2 is begin return c; end;
        begin :1 := tc(!' || c.n || '); end;' using out v;
      dbms_output.put_line(rpad(c.n, 27) || ': ' || v);

    exception when others then
      dbms_output.put_line(c.n || ': ' || sqlerrm);
    end;

  end loop;

  dbms_output.new_line;
  
end;
/
