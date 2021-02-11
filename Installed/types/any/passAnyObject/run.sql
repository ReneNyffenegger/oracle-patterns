declare

--
-- Variables for the transient type and the instance
-- that is created from it:
--

   type_transient     anytype;
   obj_transient      anydata;

--
-- Variables for two instances of persistent types:
--
   obj_one type_one;
   obj_two type_two;

begin

--
-- Create two instances of persistent types:
--
   obj_one := new type_one(42, 'Hello world', sysdate);
   obj_two := new type_two(123.45, 'abcde');

--
-- Start creating a transient object type:
--
   anytype.beginCreate(dbms_types.typecode_object, type_transient);
   --
   -- The type has three attributes:
   --
      type_transient.addAttr('NUM', dbms_types.TYPECODE_NUMBER  , prec => null, scale => null, len=> null,csid => null, csfrm => null);
      type_transient.addAttr('TXT', dbms_types.TYPECODE_varchar2, prec => null, scale => null, len=>  100,csid => null, csfrm => null);
      type_transient.addAttr('DAT', dbms_types.TYPECODE_date    , prec => null, scale => null, len=> null,csid => null, csfrm => null);

   type_transient.endCreate;

--
-- Start creating an instance of that type:
-- 
   anyData.beginCreate(type_transient, obj_transient);

      obj_transient.setNumber(42);
      obj_transient.setVarchar2('Hello world');
      obj_transient.setDate(sysdate);

   obj_transient.endCreate();

   passAnyObject(obj_transient                       );
   passAnyObject(anyData.convertObject  (obj_one    ));
   passAnyObject(anyData.convertObject  (obj_two    ));
   passAnyObject(anyData.convertVarchar2('some text'));

   -- tq84_any_test.p(anydata.convertObject(obj));
end;
/
