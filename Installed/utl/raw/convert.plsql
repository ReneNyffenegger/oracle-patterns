declare
   latin_1_string_raw raw(100);
   utf_8___string_raw raw(100);
begin

  latin_1_string_raw := hextoraw(
    'e4' || -- 'ä'
    'f6' || -- 'ö'
    'fc'    -- 'ü'
  );
  
  
  utf_8___string_raw := utl_raw.convert(
    latin_1_string_raw,
    to_charset   => 'UTF8',
    from_charset => 'WE8ISO8859P1'
  );
  
  dbms_output.put_line('äöü in UTF8 is:');
  dbms_output.put_line(rawtohex(utf_8___string_raw));

end;
/
--
-- äöü in UTF8 is:
-- C3A4C3B6C3BC
--
