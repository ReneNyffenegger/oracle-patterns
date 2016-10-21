-- The »own« session can be found like so:
select * from v$session where audsid = userenv('sessionid');
