declare

  function b2v(b boolean) return varchar2 is -- {
  begin
    if b then return 'true'; end if;
    return 'false';
  end b2v; -- }

begin

  dbms_output.put_line('is_oracle_server: ' || b2v(utl_ident.is_oracle_server));
  dbms_output.put_line('is_oracle_client: ' || b2v(utl_ident.is_oracle_client));
  dbms_output.put_line('is_timesten:      ' || b2v(utl_ident.is_timesten     ));

end;
/
