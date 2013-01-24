connect sys as sysdba

drop table rene.fga_log_archive;

--  Create the table to store the
--  archived audit data:

create table rene.fga_log_archive (
  sessionid                    number not null,
--timestamp#                   date,        -- Desupported anyway, use ntimestamp# instead.
--dbuid                        varchar2(30),
  osuid                        varchar2(255),
  oshst                        varchar2(128),
  clientid                     varchar2(64),
--extid                        varchar2(4000),
  obj$schema                   varchar2(30),
  obj$name                     varchar2(128),
  policyname                   varchar2(30),
--scn                          number,
  sqltext                      varchar2(4000),
--lsqltext                     clob,
--sqlbind                      varchar2(4000),
--comment$text                 varchar2(4000),
--plhol                        long,
  stmt_type                    number,
  ntimestamp#                  timestamp(6),
--proxy$sid                    number,
--user$guid                    varchar2(32),
--instance#                    number,
--process#                     varchar2(16),
--xid                          raw(8),
--auditid                      varchar2(64),
  statement                    number,
--entryid                      number,
--dbid                         number,
--lsqlbind                     clob,
  obj$edition                  varchar2(30)
)
partition by range (ntimestamp#)
interval (numtoyminterval(1, 'month')) (
  partition fga_log_archive_init_part values less than (date '2013-01-01')
);


---

begin

  dbms_audit_mgmt.init_cleanup(
     audit_trail_type          => dbms_audit_mgmt.audit_trail_fga_std,
     default_cleanup_interval  => 999
  );

end;
/
