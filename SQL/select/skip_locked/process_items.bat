@rem
@rem  There are 6 items to be processed in tq84_queue.
@rem  
@rem  So, we call call_process_next_item 7 times, once
@rem  for each item and once to determine how Oracle
@rem  handles the queue if there are no more entries
@rem  in it.
@rem 

start cmd.exe /k sqlplus -S rene/rene @call_process_next_item 
start cmd.exe /k sqlplus -S rene/rene @call_process_next_item 
start cmd.exe /k sqlplus -S rene/rene @call_process_next_item 
start cmd.exe /k sqlplus -S rene/rene @call_process_next_item 
start cmd.exe /k sqlplus -S rene/rene @call_process_next_item 
start cmd.exe /k sqlplus -S rene/rene @call_process_next_item 
start cmd.exe /k sqlplus -S rene/rene @call_process_next_item 
