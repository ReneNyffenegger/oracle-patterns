The table [tq84_queue](https://raw.github.com/ReneNyffenegger/oracle-patterns/master/SQL/select/skip_locked/create_tab.sql) has records with a status. This status is either *TODO* or *DONE*.

This table is filled with [insert_initial.sql](https://raw.github.com/ReneNyffenegger/oracle-patterns/master/SQL/select/skip_locked/insert_initial.sql)

[tq84_process_next_item](https://raw.github.com/ReneNyffenegger/oracle-patterns/master/SQL/select/skip_locked/process_next_item.plsql) is a procedure that selects an item from `tq84_queue` whose status
is *TODO* and whose record is not locked. After waiting a while (`dbms_lock`), it updates that record to *DONE*.

[process_items.bat](https://raw.github.com/ReneNyffenegger/oracle-patterns/master/SQL/select/skip_locked/process_items.bat) is a bat file that spawns a few `SQL*plus` sessions, each to call the
script `[call_process_next_item.sql](https://raw.github.com/ReneNyffenegger/oracle-patterns/master/SQL/select/skip_locked/call_process_next_item.sql) which, in turn, calls `process_next_item'

Use [install.sql](https://raw.github.com/ReneNyffenegger/oracle-patterns/master/SQL/select/skip_locked/install.sql) to install the thing.
