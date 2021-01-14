declare
   h raw(32); -- 32 * 8-bit = 256-bit

   c clob := q'[foo
bar
baz]';

begin
   h := dbms_crypto.HASH(c, dbms_crypto.hash_sh256);
   dbms_output.put_line('hash: ' || rawtohex(h));
end;
/
