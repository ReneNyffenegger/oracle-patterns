create or replace procedure passAnyObject(obj anydata) is

   obj_2             type_two;
   typeName          varchar2(100);
   typeCode          integer;
   typeCode_getInfo  integer;
   typeCodeText      varchar2(50);
   objType           anytype;

   prec              pls_integer;
   scale             pls_integer;
   len               pls_integer;
   csid              pls_integer;
   csfrm             pls_integer;

   schema_name       varchar2(100);
   type_name         varchar2(100);
   version           varchar2(100);
   numelems          pls_integer;

--
-- Prevent  PLS-00363: expression 'OBJ' cannot be
--          used as an assignment target:
--
   obj_              anyData := obj;

   function typeCodeToText(tc pls_integer) return varchar2 is
   begin
     return
        case tc

             when dbms_types.typecode_object   then 'object'
             when dbms_types.typecode_varchar2 then 'varchar2'
             when dbms_types.typecode_number   then 'number'
             when dbms_types.typecode_date     then 'date'
             when dbms_types.typecode_char     then 'char'
             else                                   'todo: implement me'
        end;

    end typeCodeToText;

begin

   typeName := obj_.getTypename;
   typeCode := obj_.getType(objType);

   typeCodeText := typeCodeToText(typeCode);

   dbms_output.put_line('Received ' || typeCodeText || ' with type name ' || typeName);

   if objType is null then
      dbms_output.put_line('  objType is null');
   end if;

--
-- Special treatment for instance of type_two: get an
-- object for that type:
--
   if typeName = user || '.TYPE_TWO' then

      if obj_.getObject(obj_2) = dbms_types.success then

         dbms_output.put_line('  obj_2.a = ' || obj_2.a);
         dbms_output.put_line('  obj_2.b = ' || obj_2.b);
       else
         dbms_output.put_line('  getObject failed');
       end if;

   end if;


   case typeCode
   when dbms_types.typecode_object then

        typeCode_getInfo := objType.getInfo(
               prec, scale, len, csid, csfrm,
               schema_name, type_name,
               version,
               numelems
        );

         dbms_output.put_line('  object ' || schema_name || '.' || type_name || ' has ' || numelems || ' elements');

      --
      -- Why is it not possible to access the members
      -- in an anyType by name or position?
      --
         obj_.piecewise;
         for pos in 1 .. numelems loop

             declare
                attr_elt_type anytype;
                aname varchar2(100);
                val   varchar2(100);
                ret   pls_integer;
             begin

                 typeCode := objType.getAttrElemInfo(
                     pos,
                     prec, scale, len, csid, csfrm,
                     attr_elt_type,
                     aname
                 );

                 case when typeCode = dbms_types.typecode_varchar2 then ret := obj_.getVarchar2(val);
                      when typeCode = dbms_types.typecode_number   then ret := obj_.getNumber  (val);
                      when typecode = dbms_types.typecode_date     then ret := obj_.getDate    (val);
                      when typecode = dbms_types.typecode_char     then ret := obj_.getChar    (val);
                      else val := '?';
                 end case;

                 dbms_output.put_line('  ' || aname || ' (' || typeCodeToText(typeCode) || ') - prec: ' || prec || ', scale: ' || scale || ', len: ' || len || ', val = ' || val);

             end;
           end loop;

      when dbms_types.typecode_varchar2 then
      --
      -- Alternatively, use obj_.getVarchar2(vc):
      --
         dbms_output.put_line('  Varchar2 is: ' || obj_.accessVarchar2);
      else
         dbms_output.put_line('  TODO: implment me');
      end case;

      dbms_output.put_line('');

end passAnyObject;
/

show errors
