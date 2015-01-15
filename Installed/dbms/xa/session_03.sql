select * from tq84_xa;

declare
    ret_txt varchar2(100);
begin

    ret_txt := tq84_xa_result_to_string( sys.dbms_xa.xa_commit(dbms_xa_xid(42), onePhase => true) );
    
    if ret_txt != 'OK' then
       dbms_output.put_line('Error committing: ' || ret_txt);
    end if;
end;
/

select * from tq84_xa;
