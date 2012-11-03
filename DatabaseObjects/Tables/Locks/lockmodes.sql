create table tq84_lock_row_share           (col1 number);
create table tq84_lock_row_exclusive       (col1 number);
create table tq84_lock_share_update        (col1 number);
create table tq84_lock_share               (col1 number);
create table tq84_lock_share_row_exclusive (col1 number);
create table tq84_lock_exclusive           (col1 number);

lock table tq84_lock_row_share           in row   share      mode;
lock table tq84_lock_row_exclusive       in row   exclusive  mode;
lock table tq84_lock_share_update        in share update     mode;
lock table tq84_lock_share               in share            mode;
lock table tq84_lock_share_row_exclusive in row exclusive    mode;
lock table tq84_lock_exclusive           in exclusive        mode;

-- Locking a table creates a "TM" lock.

select 
  lmode, 
  decode (
    lmode,
    0, 'none           ',
    1, 'null       NULL',
    2, 'row-S      SS  ',
    3, 'row-X      SX  ',
    4, 'share      S   ',
    5, 'S/row-X    SSX ',
    6, 'exclusive  X   ',
       '?          ?   '
  ) lmode_decoded,
  object_name 
  from v$lock join user_objects on v$lock.id1 = user_objects.object_id
 where sid = sys_context('USERENV','SID') and
       type = 'TM'
 order by lmode;

drop table tq84_lock_row_share           purge;
drop table tq84_lock_row_exclusive       purge;
drop table tq84_lock_share_update        purge;
drop table tq84_lock_share               purge;
drop table tq84_lock_share_row_exclusive purge;
drop table tq84_lock_exclusive           purge;
