select
--common   is_common_profile,
  profile  profile_name,
  max(case when resource_name = 'COMPOSITE_LIMIT'            then limit end) composite,
  max(case when resource_name = 'CONNECT_TIME'               then limit end) connect_time,
  max(case when resource_name = 'CPU_PER_CALL'               then limit end) cpu_per_call,
  max(case when resource_name = 'CPU_PER_SESSION'            then limit end) cpu_per_session,
  max(case when resource_name = 'IDLE_TIME'                  then limit end) idle_time,
  max(case when resource_name = 'LOGICAL_READS_PER_CALL'     then limit end) logical_reads_per_call,
  max(case when resource_name = 'LOGICAL_READS_PER_SESSION'  then limit end) logical_reads_per_session,
  max(case when resource_name = 'PRIVATE_SGA'                then limit end) private_sga,
  max(case when resource_name = 'SESSIONS_PER_USER'          then limit end) sessions_per_user,
  max(case when resource_name = 'FAILED_LOGIN_ATTEMPTS'      then limit end) failed_login_attempts,
  max(case when resource_name = 'PASSWORD_GRACE_TIME'        then limit end) password_grace_time,
  max(case when resource_name = 'PASSWORD_LIFE_TIME'         then limit end) password_life_time,
  max(case when resource_name = 'PASSWORD_LOCK_TIME'         then limit end) password_lock_time,
  max(case when resource_name = 'PASSWORD_REUSE_MAX'         then limit end) password_reuse_max,
  max(case when resource_name = 'PASSWORD_REUSE_TIME'        then limit end) password_reuse_time,
  max(case when resource_name = 'PASSWORD_VERIFY_FUNCTION'   then limit end) password_verify_function
from
  dba_profiles
group by
--common,
  profile;
