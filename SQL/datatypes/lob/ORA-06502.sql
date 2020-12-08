create table tq84_clob (
   txt clob
);

declare
   c clob;
   vc_32K_minus_1 varchar2(32767) := rpad('*', 32767, '*');
begin

   c := vc_32K_minus_1 || vc_32K_minus_1;

   begin
      c := vc_32K_minus_1 || vc_32K_minus_1 || '**';
   exception when others then
   --
   -- ORA-06502: PL/SQL: numeric or value error: character string buffer too small
   --
      dbms_output.put_line(sqlerrm);
   end;

   c := to_clob(vc_32K_minus_1) || vc_32K_minus_1 || vc_32K_minus_1 || vc_32K_minus_1 || vc_32K_minus_1 || vc_32K_minus_1;

   insert into tq84_clob values(c);

end;
/

select dbms_lob.getLength(txt) len_actual, 6*32767 len_expected from tq84_clob;

drop table tq84_clob;
