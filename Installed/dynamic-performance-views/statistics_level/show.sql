select
  statistics_name,
  description,
  statistics_view_name
from
  v$statistics_level
order by
  lower(statistics_name);
--
-- Active Session History                  Monitors active session activity using MMNL                                                                            V$ACTIVE_SESSION_HISTORY
-- Adaptive Thresholds Enabled             Controls if Adaptive Thresholds should be enabled
-- Automated Maintenance Tasks             Controls if Automated Maintenance should be enabled
-- Bind Data Capture                       Enables capture of bind values used by SQL statements                                                                  V$SQL_BIND_CAPTURE
-- Buffer Cache Advice                     Predicts the impact of different cache sizes on number of physical reads                                               V$DB_CACHE_ADVICE
-- Global Cache Statistics                 RAC Buffer Cache statistics
-- Longops Statistics                      Enables Longops Statistics                                                                                             V$SESSION_LONGOPS
-- Modification Monitoring                 Enables modification monitoring
-- MTTR Advice                             Predicts the impact of different MTTR settings on number of physical I/Os                                              V$MTTR_TARGET_ADVICE
-- PGA Advice                              Predicts the impact of different values of pga_aggregate_target on the performance of memory intensive SQL operators   V$PGA_TARGET_ADVICE
-- Plan Execution Sampling                 Enables plan lines sampling                                                                                            V$ACTIVE_SESSION_HISTORY
-- Plan Execution Statistics               Enables collection of plan execution statistics                                                                        V$SQL_PLAN_STATISTICS
-- Segment Level Statistics                Enables gathering of segment access statistics                                                                         V$SEGSTAT
-- Shared Pool Advice                      Predicts the impact of different values of shared_pool_size on elapsed parse time saved                                V$SHARED_POOL_ADVICE
-- SQL Monitoring                          Controls if SQL Monitoring should be enabled                                                                           V$SQL_MONITORING
-- Streams Pool Advice                     Predicts impact on Streams perfomance of different  Streams pool sizes                                                 V$STREAMS_POOL_ADVICE
-- Threshold-based Alerts                  Controls if Threshold-based Alerts should be enabled
-- Time Model Events                       Enables Statics collection for time events                                                                             V$SESS_TIME_MODEL
-- Timed OS Statistics                     Enables gathering of timed operating system statistics
-- Timed Statistics                        Enables gathering of timed statistics
-- Ultrafast Latch Statistics              Maintains statistics for ultrafast latches in the fast path
-- Undo Advisor, Alerts and Fast Ramp up   Transaction layer manageability features                                                                               V$UNDOSTAT
-- V$IOSTAT_* statistics                   Controls if I/O stats in v$iostat_ should be enabled
