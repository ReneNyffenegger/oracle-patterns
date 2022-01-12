declare

   profile_name varchar2(32) := 'renes_sql_translation_profile';

begin

   begin
      dbms_sql_translator.drop_profile(profile_name);
   exception when others then
      if sqlcode = -24254 then null; end if;
   end;

   dbms_sql_translator.create_profile('renes_sql_translation_profile');

   dbms_sql_translator.set_attribute(
      profile_name,
      dbms_sql_translator.attr_translator,
     'renes_sql_translator'
   );	

end;
/
