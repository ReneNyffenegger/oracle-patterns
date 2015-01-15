@drop_if_exists tq84_xa

create table tq84_xa (
   txt       varchar2(40)
);

@drop_if_exists tq84_xa_result_to_string

create function tq84_xa_result_to_string(res number) return varchar2 as
begin

  return 
    case res
      when sys.dbms_xa.xa_ok           then 'OK'
      when sys.dbms_xa.xa_rbbase       then 'XA_RBBASE: Inclusive lower bound of the rollback codes'
      when sys.dbms_xa.xa_rbrollback   then 'XA_RBROLLBACK: Rollback was caused by an unspecified reason'
      when sys.dbms_xa.xa_rbcommfail   then 'XA_RBCOMMFAIL: Rollback was caused by a communication failure'
      when sys.dbms_xa.xa_rbdeadlock   then 'XA_RBDEADLOCK: Deadlock was detected'
      when sys.dbms_xa.xa_rbintegrity  then 'XA_RBINTEGRITY: Condition that violates the integrity of the resources was detected'
      when sys.dbms_xa.xa_rbother      then 'XA_RBOTHER: Resource manager rolled back the transaction for an unlisted reason'
      when sys.dbms_xa.xa_rbproto      then 'XA_RBPROTO: Protocol error occurred in the resource manager'
      when sys.dbms_xa.xa_rbtimeout    then 'XA_RBTIMEOUT: Transaction branch took long'
      when sys.dbms_xa.xa_rbtransient  then 'XA_RBTRANSIENT: May retry the transaction branch'
      when sys.dbms_xa.xa_rbend        then 'XA_RBEND: Inclusive upper bound of the rollback codes'
      when sys.dbms_xa.xa_nomigrate    then 'XA_NOMIGRATE: Transaction branch may have been heuristically completed'
      when sys.dbms_xa.xa_heurhaz      then 'XA_HEURHAZ: Transaction branch may have been heuristically completed'
      when sys.dbms_xa.xa_heurcom      then 'XA_HEURCOM: Transaction branch has been heuristically committed'
      when sys.dbms_xa.xa_heurrb       then 'XA_HEURRB: Transaction branch has been heuristically rolled back'
      when sys.dbms_xa.xa_heurmix      then 'XA_HEURMIX: Some of the transaction branches have been heuristically committed, others rolled back'
      when sys.dbms_xa.xa_retry        then 'XA_RETRY: Routine returned with no effect and may be re-issued'
      when sys.dbms_xa.xa_rdonly       then 'XA_RDONLY: Transaction was read-only and has been committed'
      when sys.dbms_xa.xa_ok           then 'XA_OK: Normal execution'
      when sys.dbms_xa.xaer_async      then 'XAER_ASYNC: Asynchronous operation already outstanding'
      when sys.dbms_xa.xaer_rmerr      then 'XAER_RMERR: Resource manager error occurred in the transaction branch'
      when sys.dbms_xa.xaer_nota       then 'XAER_NOTA: XID is not valid'
      when sys.dbms_xa.xaer_inval      then 'XAER_INVAL: Invalid arguments were given'
      when sys.dbms_xa.xaer_proto      then 'XAER_PROTO: Routine invoked in an improper context'
      when sys.dbms_xa.xaer_rmfail     then 'XAER_RMFAIL: Resource manager unavailable'
      when sys.dbms_xa.xaer_dupid      then 'XAER_DUPID: XID already exists'
      when sys.dbms_xa.xaer_outside    then 'XAER_OUTSIDE: Resource manager doing work outside global transaction'
      else '?'
    end;


end tq84_xa_result_to_string;
/
