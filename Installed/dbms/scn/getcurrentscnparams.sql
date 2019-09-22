declare
   rsl             number;
   headroom_in_scn number;
   headroom_in_sec number;
   cur_scn_compat  number;
   max_scn_compat  number;
begin

   dbms_scn.getCurrentSCNparams(
      rsl            ,
      headroom_in_scn,
      headroom_in_sec,
      cur_scn_compat ,
      max_scn_compat
    );

   dbms_output.put_line('Reasonable scn limit (soft limit): ' || to_char(rsl            , '999,999,999,999,999,999'));
   dbms_output.put_line('Headroom in SCN                  : ' || to_char(headroom_in_scn, '999,999,999,999,999,999'));
   dbms_output.put_line('Headroom in seconds              : ' || headroom_in_sec);
   dbms_output.put_line('Current scn compatibility scheme : ' || cur_scn_compat );
   dbms_output.put_line('Max scn compatibility scheme     : ' || max_scn_compat );
end;
/
