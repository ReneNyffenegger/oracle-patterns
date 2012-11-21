drop procedure tq84_process_next_item;
drop table tq84_queue;

@create_tab.sql
@insert_initial.sql
@process_next_item.plsql

prompt execute process_items.bat now.
