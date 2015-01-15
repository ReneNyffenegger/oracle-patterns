declare

    ret_txt varchar2(100);
begin

 -- tmnoflags: create new transaction branch
    ret_txt := tq84_xa_result_to_string( sys.dbms_xa.xa_start(dbms_xa_xid(42), dbms_xa.tmnoflags) );
    if ret_txt != 'OK' then
       dbms_output.put_line('Error opening transaction branch: ' || ret_txt);
       return;
    end if;

    insert into tq84_xa values ('This is session one');

    ret_txt := tq84_xa_result_to_string( sys.dbms_xa.xa_end(dbms_xa_xid(42), dbms_xa.tmsuspend) );
    if ret_txt != 'OK' then
       dbms_output.put_line('Error: ' || ret_txt);
       return;
    end if;



end;
/

select * from v$global_transaction where globalid = dbms_xa_xid(42).gtrid;
