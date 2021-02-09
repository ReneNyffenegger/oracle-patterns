declare
  c   integer;
  r   integer;
begin

   c := dbms_sql.open_cursor;

   dbms_sql.parse(c,
   q'{
      select -- sql bind capture test
         *
      from
         user_objects
      where
         object_name like :obj_name and
         object_type like :obj_type
    }',
    dbms_sql.native);

   dbms_sql.bind_variable(c, 'OBJ_NAME', '%A%');
   dbms_sql.bind_variable(c, 'OBJ_TYPE', '%B%');

   r := dbms_sql.execute(c);

   dbms_sql.close_cursor(c);

end;
/

select
   cap.name,
   cap.value_string,
   cap.value_anydata,
   cap.max_length,
   cap.datatype_string,
   cap.was_captured,
   cap.last_captured,
   cap.character_sid,
   sql.sql_fulltext,
   cap.sql_id,
   cap.child_number
from
   v$sql                                                         sql left join
   v$sql_bind_capture cap on sql.sql_id = cap.sql_id and
                             sql.child_number = cap.child_number
where
   regexp_like(sql.sql_text, '\A *select -- sql bind capture test ')
order by
   sql.child_address,
   cap.position
;
