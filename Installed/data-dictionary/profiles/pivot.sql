select
   usr.username,
   usr.profile,
   prf.composite_limit,
   prf.connect_time,
   prf.cpu_per_call,
   prf.cpu_per_session,
   prf.idle_time,
   prf.logical_reads_per_call,
   prf.logical_reads_per_session,
   prf.private_sga,
   prf.sessions_per_user,
   prf.failed_login_attempts,
   prf.inactive_account_time,
   prf.password_grace_time,
   prf.password_life_time,
   prf.password_lock_time,
   prf.password_reuse_max,
   prf.password_reuse_time,
   prf.password_verify_function
from
   dba_users    usr     left join
--select * from
   dba_profiles  pivot (
      max(limit)  for
      (
        resource_type,
        resource_name
      ) in
      (
        ('KERNEL'  , 'COMPOSITE_LIMIT'          )  as COMPOSITE_LIMIT          ,
        ('KERNEL'  , 'CONNECT_TIME'             )  as CONNECT_TIME             ,
        ('KERNEL'  , 'CPU_PER_CALL'             )  as CPU_PER_CALL             ,
        ('KERNEL'  , 'CPU_PER_SESSION'          )  as CPU_PER_SESSION          ,
        ('KERNEL'  , 'IDLE_TIME'                )  as IDLE_TIME                ,
        ('KERNEL'  , 'LOGICAL_READS_PER_CALL'   )  as LOGICAL_READS_PER_CALL   ,
        ('KERNEL'  , 'LOGICAL_READS_PER_SESSION')  as LOGICAL_READS_PER_SESSION,
        ('KERNEL'  , 'PRIVATE_SGA'              )  as PRIVATE_SGA              ,
        ('KERNEL'  , 'SESSIONS_PER_USER'        )  as SESSIONS_PER_USER        ,

        ('PASSWORD', 'FAILED_LOGIN_ATTEMPTS'    )  as FAILED_LOGIN_ATTEMPTS    ,
        ('PASSWORD', 'INACTIVE_ACCOUNT_TIME'    )  as INACTIVE_ACCOUNT_TIME    ,
        ('PASSWORD', 'PASSWORD_GRACE_TIME'      )  as PASSWORD_GRACE_TIME      ,
        ('PASSWORD', 'PASSWORD_LIFE_TIME'       )  as PASSWORD_LIFE_TIME       ,
        ('PASSWORD', 'PASSWORD_LOCK_TIME'       )  as PASSWORD_LOCK_TIME       ,
        ('PASSWORD', 'PASSWORD_REUSE_MAX'       )  as PASSWORD_REUSE_MAX       ,
        ('PASSWORD', 'PASSWORD_REUSE_TIME'      )  as PASSWORD_REUSE_TIME      ,
        ('PASSWORD', 'PASSWORD_VERIFY_FUNCTION' )  as PASSWORD_VERIFY_FUNCTION
      )
  ) prf
  on usr.profile = prf.profile
order by
   usr.username;

