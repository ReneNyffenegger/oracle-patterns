declare
  str  varchar2(100) := 'foo bar >words and such< baz';
begin
   dbms_output.put_line(regexp_substr(
      str    ,  -- Text
     '[^><]+',  -- Any repetation of characters that don't match the delimiters > and <
      1      ,  -- Start at first position
      2         -- Second occurence (The first is before >)
     )
   );
end;
/

