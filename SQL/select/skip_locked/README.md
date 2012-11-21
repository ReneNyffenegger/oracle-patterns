The table `tq84_queue` has records with a status. This status is either *TODO* or *DONE*.

This table is filled with `insert_initial.sql`

`tq84_process_next_item` is a procedure that selects an item from `tq84_queue` whose status
is *TODO* and whose record is not locked.

`process_items.bat` is a bat file that spawns a few `SQL*plus` sessions, each to call the
script `call_process_next_item.sql` which, in turn, calls `process_next_item'

Use `install.sql` to install the thing.
