declare
  c   integer;
  r   integer;
begin

   c := dbms_sql.open_cursor;

   dbms_sql.parse(c,
   q'{
      select -- sql bind metadata test
         *
      from
         user_objects
      where
         object_name like :obj_name and
         object_type like :obj_type
    }',
    dbms_sql.native);

   dbms_sql.bind_variable(c, 'OBJ_NAME', '%Y%');
   dbms_sql.bind_variable(c, 'OBJ_TYPE', '%Z%');

   r := dbms_sql.execute(c);

   dbms_sql.close_cursor(c);

end;
/

select
   bnd.bind_name,
   bnd.datatype,
   bnd.max_length,
   sql.sql_fulltext,
   bnd.position,
   bnd.array_len
from
   v$sql                                                         sql left join
   v$sql_bind_metadata bnd on sql.child_address = bnd.address
where
   regexp_like(sql.sql_text, '\A *select -- sql bind metadata test ')
order by
   sql.child_address,
   bnd.position
;
