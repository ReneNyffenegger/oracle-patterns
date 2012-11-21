create or replace procedure tq84_process_next_item is 

    start_  date := sysdate;
    end_    date;

begin

    for next_item in (

        select * from tq84_queue
         where status = 'TODO'
         order by item
           for update skip locked

    ) loop

        dbms_output.put_line('Processing item ' || next_item.item);

    --  Pretend the processing an item takes between
    --  ten and twenty seconds:
        dbms_lock.sleep(dbms_random.value(10, 20));

        update tq84_queue 
           set status = 'DONE'
         where item = next_item.item;

        exit; -- Process one item only.

    end loop;


    commit;

    end_  := sysdate;

    dbms_output.put_line('Processing time: ' || to_char(start_, 'hh24:mi:ss') || ' - ' || 
                                                to_char(end_  , 'hh24:mi:ss') || '   ' ||
                         'Total: ' || ( (end_ - start_) * 24*60*60) || ' seconds');

end tq84_process_next_item;
/
