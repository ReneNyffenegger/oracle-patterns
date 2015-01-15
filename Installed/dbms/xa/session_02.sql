select * from tq84_xa;


declare


    ret_txt varchar2(100);

begin

 -- Note: tmresume rather than tmnoflags
    ret_txt := tq84_xa_result_to_string( sys.dbms_xa.xa_start(dbms_xa_xid(42), dbms_xa.tmresume) );
    if ret_txt != 'OK' then
       dbms_output.put_line('Error opening transaction branch: ' || ret_txt);
       return;
    end if;

    insert into tq84_xa values ('This is session two');

 -- Note tmsuccess rather than tmsuspend
    ret_txt := tq84_xa_result_to_string( sys.dbms_xa.xa_end(dbms_xa_xid(42), dbms_xa.tmsuccess) );
    if ret_txt != 'OK' then
       dbms_output.put_line('Error: ' || ret_txt);
       return;
    end if;



end;
/

select * from tq84_xa;
