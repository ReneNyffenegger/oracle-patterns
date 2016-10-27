--
--  The resultset of the following query should be empty:
--
(  select name from v$datafile minus select name from v$dbfile  ) union all
(  select name from v$dbfile   minus select name from v$datafile);
