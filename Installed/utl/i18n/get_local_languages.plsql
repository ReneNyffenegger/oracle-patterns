declare
  languages utl_i18n.string_array;
  langNo    number;
begin

  languages := utl_i18n.get_local_languages('Switzerland');

  langNo := languages.first;
  while langNo is not null loop
      dbms_output.put_line(langNo || ': ' || initcap(languages(langNo)));
      langNo := languages.next(langNo);
  end loop;

end;
/
-- 0: German
-- 1: French
-- 2: Italian
