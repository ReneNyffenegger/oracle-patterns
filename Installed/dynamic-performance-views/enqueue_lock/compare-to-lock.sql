select addr, kaddr, sid, type, id1, id2, lmode, request, block from v$enqueue_lock minus
select addr, kaddr, sid, type, id1, id2, lmode, request, block from v$lock;

select addr, kaddr, sid, type, id1, id2, lmode, request, block from v$lock minus
select addr, kaddr, sid, type, id1, id2, lmode, request, block from v$enqueue_lock;
