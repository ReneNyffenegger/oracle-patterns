declare
   objects_available boolean;
begin

   if user != 'RENE' then -- {
      dbms_output.put_line('Script must be run as RENE');
      return;
   end if; -- }

   if sys_context('userenv', 'db_name') != 'THEDB' then -- {
      dbms_output.put_line('Script must be run on database THEDB');
      return;
   end if; -- }

   loop -- {
      objects_available := false;

      for r in ( -- {
        select
            obj.object_name,
            obj.object_type
         from
            user_objects     obj
         where
              obj.object_type not in ('INDEX', 'LOB', 'PACKAGE_BODY') and
         not (obj.object_type = 'SEQUENCE' and obj.generated = 'Y') -- Prevent ORA-32794: cannot drop a system-generated sequence
       minus
         select
            referenced_name       ,
            referenced_type
        from
            user_dependencies
        where
         not
         (
            (referenced_type = 'PACKAGE'      and referenced_owner = 'SYS' and referenced_name = 'STANDARD') or
            (referenced_type = 'PACKAGE BODY' and referenced_owner = 'SYS' and referenced_name = 'STANDARD')
         )
      )
      loop
          dbms_output.put_line('drop ' || r.object_type || ' ' || r.object_name || case when r.object_type = 'TABLE' then ' purge' end);
          objects_available := true;
          execute immediate    'drop ' || r.object_type || ' ' || r.object_name || case when r.object_type = 'TABLE' then ' purge' end ;
      end loop; -- }

      exit when not objects_available;

   end loop; -- }

end;
/
