create table tq84_fga_1 (
       col_1 number,
       col_2 varchar2(20)
);


begin
  dbms_fga.add_policy (
       object_schema =>  user,
       object_name   => 'tq84_fga_1',
       policy_name   => 'tq84_fga_1_policy'
  );
end;
/


select
  policy_name,
  sel,
  ins,
  upd,
  del,
  audit_trail
from
  user_audit_policies
where
  object_name = 'TQ84_FGA_1';


insert into tq84_fga_1 values (1, 'one');
insert into tq84_fga_1 values (2, 'two');

select * from tq84_fga_1 where col_1 = 1;

select 
--policy_name,
  statement_type,
  timestamp,
--os_user,
  db_user
from
  dba_fga_audit_trail
where
  policy_name = 'TQ84_FGA_1_POLICY';


-- dba_fga_audit_trail accessed sys.fga_log$
select 
--policy_name,
  stmt_type,
  timestamp#,
--os_user,
  dbuid
from
  sys.fga_log$
where
  policyname = 'TQ84_FGA_1_POLICY';

drop table tq84_fga_1;
