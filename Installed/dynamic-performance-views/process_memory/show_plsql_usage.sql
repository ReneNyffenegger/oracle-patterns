declare

  procedure show_memory_usage is -- {
  begin

    dbms_output.new_line;

    for r in ( -- {
    
      select -- {
            mem.category          mem_category,
        nvl(mem.allocated    , 0) mem_allocated,
        nvl(mem.used         , 0) mem_used,
        nvl(mem.max_allocated, 0) mem_max_allocated
      from
        v$session        ses                                  join
        v$process        prc on ses.paddr   = prc.addr        join
        v$process_memory mem on prc.pid     = mem.pid     and
                                prc.serial# = mem.serial#
      where
        ses.audsid = userenv('sessionid') -- }

    ) loop
     
       dbms_output.put_line(
         rpad   (r.mem_category                  , 10             ) ||
         to_char(r.mem_allocated     / 1024/1024 , '999,999,990.9') || ' MB  ' ||
         to_char(r.mem_used          / 1024/1024 , '999,999,990.9') || ' MB  ' ||
         to_char(r.mem_max_allocated / 1024/1024 , '999,999,990.9') || ' MB'
      );
    
    end loop; -- }

  end show_memory_usage; -- }

  procedure do_stuff is -- {

    type all_objects_t is table of all_objects%rowtype index by pls_integer;
    all_objects_v all_objects_t;
  begin

    dbms_output.new_line;
    dbms_output.put_line('Doing stuff....');

    select * bulk collect into all_objects_v
    from all_objects;

    show_memory_usage;
    

  end do_stuff; -- }

begin

  show_memory_usage;

  do_stuff;

  dbms_output.new_line;
  dbms_output.put_line('Stuff done...');

  show_memory_usage;

end;
/
