create user schem_01 identified by schem_01;
create user schem_02 identified by schem_02;
-- grant create session,
--       create procedure
--       to schem_01;


create table schem_01.tab ( a number );
create table schem_02.tab ( a number );

grant all on schem_02.tab to public;

create synonym syn_table for schem_02.tab;

create package schem_02.pck as
       procedure foo;
end pck;
/

grant execute on schem_02.pck to public;


create procedure tq84_resolve_identifier(identifier in varchar2) is --{

       object_is_identified boolean;

       function try_context(ctx in number, object_type in varchar2) return boolean is -- {

            schema     varchar2(30);
            part1      varchar2(30);
            part2      varchar2(30);
            dblink     varchar2(128);
            part1_type number;
            object_id  number;

       begin


            dbms_utility.name_resolve(identifier, ctx,
                              schema, part1, part2, dblink, part1_type, object_id);

            if object_id > 0 then -- {

               dbms_output.put_line(identifier || ' is in reality a ' || object_type || ', object id = ' || object_id);
               dbms_output.put_line('  schema:     ' || schema);
               dbms_output.put_line('  part1:      ' || part1);
               dbms_output.put_line('  part2:      ' || part2);
               dbms_output.put_line('  dblink:     ' || dblink);
               dbms_output.put_line('  part1 type: ' || case    part1_type
                                                           when 5 then 'synonym'
                                                           when 7 then 'procecure (top level)'
                                                           when 8 then 'function'
                                                           when 9 then 'package'
                                                           else to_char(part1_type) end);

               return true;   -- Something found

             end if; -- }

            return false;  -- Nothing found


       exception when others then

            if sqlcode = -6564 then -- ORA-06564: object .... does not exist
--             dbms_output.put_line(identifier || ' exists, but is inaccessible'); -- TODO Is this the case?
               return false;
            end if;

            if sqlcode = -4047 then -- ORA-04047: object specified is incompatible with the flag specified
               return false;
            end if;

            if sqlcode = -911 then -- ORA-00911: invalid character
               dbms_output.put_line(identifier || ' contains invalid characters');
               return true;
            end if;

            dbms_output.put_line(sqlerrm);
            dbms_output.put_line(sqlcode);

       end  try_context; -- }

begin

     dbms_output.new_line;

     object_is_identified := try_context(0, 'table or view') or
                             try_context(1, 'pl/sql');

     if not object_is_identified then
        dbms_output.put_line(identifier || ' could not be identified');
     end if;


end tq84_resolve_identifier; -- }
/


exec tq84_resolve_identifier('tab'         )  /* note that Oracle ships with an object belongig to sys wit this name */;
exec tq84_resolve_identifier('does.not_exist');
exec tq84_resolve_identifier('invalid identifier');
exec tq84_resolve_identifier('schem_01.tab');
exec tq84_resolve_identifier('syn_table');
exec tq84_resolve_identifier('schem_02.pck.foo');

drop procedure tq84_resolve_identifier;
drop synonym   syn_table;

drop user schem_01 cascade;
drop user schem_02 cascade;
