create table tq84_caught_errors (
  dt        date,               
  username  varchar2( 30), -- value from ora_login_user
  msg       varchar2(4000),
  stmt      varchar2(4000)
);

create or replace trigger tq84_catch_errors
   after servererror on database
declare
   sql_text ora_name_list_t;
   msg_     varchar2(4000) := null;
   stmt_    varchar2(4000) := null;
begin

  for depth in 1 .. ora_server_error_depth loop
    msg_ := msg_ || ora_server_error_msg(depth);
  end loop;

  for i in 1 .. ora_sql_txt(sql_text) loop
     stmt_ := stmt_ || sql_text(i);
  end loop;

  insert into 
    tq84_caught_errors (dt     , username      ,msg ,stmt )
           values (sysdate, ora_login_user,msg_,stmt_);
end;
/

----- test

select * from foijf;

select dt, username, substr(stmt, 1, 100) from tq84_caught_errors;
