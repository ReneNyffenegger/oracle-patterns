with pvv as (
  select
    row_number() over (partition by name order by isdefault desc, ordinal) r,
    regexp_replace(name, '(.*_)\d+', '\1n') name,
    value,
    isdefault
  from
    v$parameter_valid_values
)
select
  pvv.name,
  max(case when pvv.r =  1 then pvv.value || case when pvv.isdefault = 'TRUE' then ' (*)' end end),
  max(case when pvv.r =  2 then pvv.value end),
  max(case when pvv.r =  3 then pvv.value end),
  max(case when pvv.r =  4 then pvv.value end),
  max(case when pvv.r =  5 then pvv.value end),
  max(case when pvv.r =  6 then pvv.value end),
  max(case when pvv.r =  7 then pvv.value end),
  max(case when pvv.r =  8 then pvv.value end),
  max(case when pvv.r =  9 then pvv.value end),
  max(case when pvv.r = 10 then pvv.value end),
  max(case when pvv.r = 11 then pvv.value end),
  max(case when pvv.r = 12 then pvv.value end),
  max(case when pvv.r = 13 then pvv.value end),
  max(case when pvv.r = 14 then pvv.value end),
  max(case when pvv.r = 15 then pvv.value end),
  max(case when pvv.r = 16 then pvv.value end),
  max(case when pvv.r = 17 then pvv.value end),
  max(case when pvv.r = 18 then pvv.value end),
  max(case when pvv.r = 19 then pvv.value end),
  max(case when pvv.r = 20 then pvv.value end),
  max(case when pvv.r = 21 then pvv.value end),
  max(case when pvv.r = 22 then pvv.value end),
  max(case when pvv.r = 23 then pvv.value end),
  max(case when pvv.r = 24 then pvv.value end),
  max(case when pvv.r = 25 then pvv.value end),
  max(case when pvv.r = 26 then pvv.value end),
  max(case when pvv.r = 27 then pvv.value end),
  max(case when pvv.r = 28 then pvv.value end),
  max(case when pvv.r = 29 then pvv.value end),
  max(case when pvv.r = 30 then pvv.value end),
  max(case when pvv.r = 31 then pvv.value end)
from
  pvv
group by
  pvv.name
order by
  pvv.name;
-- audit_trail                       DB                      OS                NONE              TRUE         FALSE          DB_EXTENDED     XML              EXTENDED
-- background_core_dump              FULL                    PARTIAL
-- cell_offload_compaction           ADAPTIVE (*)            LOW               MEDIUM            HIGH
-- cell_offload_plan_display         AUTO (*)                NEVER             ALWAYS
-- control_management_pack_access    DIAGNOSTIC+TUNING (*)   NONE              DIAGNOSTIC
-- cursor_bind_capture_destination   OFF                     MEMORY            MEMORY+DISK
-- cursor_sharing                    EXACT (*)               FORCE             SIMILAR
-- db_block_checking                 FALSE (*)               OFF               LOW               MEDIUM       TRUE           FULL
-- db_block_checksum                 TYPICAL (*)             OFF               FALSE             TRUE         FULL
-- db_cache_advice                   OFF (*)                 READY             ON
-- db_lost_write_protect             NONE (*)                TYPICAL           FULL
-- db_securefile                     PERMITTED (*)           NEVER             ALWAYS            IGNORE       FORCE
-- db_ultra_safe                     OFF (*)                 DATA_ONLY         DATA_AND_INDEX
-- fast_start_parallel_rollback      LOW (*)                 FALSE             HIGH
-- filesystemio_options              ASYNCH                  DIRECTIO          SETALL            NONE
-- instance_type                     RDBMS (*)               ASM
-- ldap_directory_access             NONE (*)                PASSWORD          SSL
-- ldap_directory_sysauth            YES                     NO
-- log_archive_dest_state_n          ENABLE                  DEFER             RESET             ALTERNATE
-- nls_comp                          BINARY (*)              LINGUISTIC        ANSI
-- nls_length_semantics              BYTE (*)                CHAR
-- nls_nchar_conv_excp               FALSE (*)               TRUE
-- optimizer_features_enable         11.2.0.3 (*)            8.0.0             8.0.3             8.0.4        8.0.5          8.0.6           8.0.7            8.1.0             8.1.3   8.1.4   8.1.5   8.1.6   8.1.7   9.0.0   9.0.1   9.2.0   9.2.0.8   10.1.0   10.1.0.3   10.1.0.4   10.1.0.5   10.2.0.1   10.2.0.2   10.2.0.3   10.2.0.4   10.2.0.5   11.1.0.6   11.1.0.7   11.2.0.1   11.2.0.2   11.2.0.3.1
-- optimizer_mode                    RULE                    CHOOSE            ALL_ROWS          FIRST_ROWS   FIRST_ROWS_1   FIRST_ROWS_10   FIRST_ROWS_100   FIRST_ROWS_1000
-- parallel_degree_policy            MANUAL (*)              LIMITED           AUTO
-- plscope_settings                  IDENTIFIERS:NONE (*)    IDENTIFIERS:ALL
-- plsql_code_type                   INTERPRETED (*)         NATIVE
-- query_rewrite_enabled             FALSE                   TRUE              FORCE
-- query_rewrite_integrity           ENFORCED                TRUSTED           STALE_TOLERATED
-- recyclebin                        ON                      OFF
-- remote_dependencies_mode          TIMESTAMP               SIGNATURE
-- remote_login_passwordfile         SHARED                  EXCLUSIVE         NONE
-- result_cache_mode                 MANUAL (*)              AUTO              FORCE
-- sec_protocol_error_trace_action   TRACE (*)               NONE              LOG               ALERT
-- serial_reuse                      DISABLE                 ALL               SELECT            DML          PLSQL          FORCE
-- shadow_core_dump                  NONE                    FULL              PARTIAL
-- standby_file_management           MANUAL (*)              AUTO
-- star_transformation_enabled       FALSE (*)               TRUE              TEMP_DISABLE
-- statistics_level                  TYPICAL (*)             BASIC             ALL
-- use_large_pages                   TRUE (*)                AUTO              ONLY              FALSE
-- workarea_size_policy              AUTO (*)                MANUAL
-- xml_db_events                     ENABLE                  DISABLE
