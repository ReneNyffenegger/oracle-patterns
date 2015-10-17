declare
--
--
--      @?/rdbms/admin/utlmail.sql
--      @?/rdbms/admin/prvtmail.plb
--
--      grant execute on utl_mail to some_user;
--
--      alter system set smtp_out_server = 'some.mail.server.xyz';
--
begin

  sys.utl_mail.send(
    sender     => 'foo@bar.xy',
    recipients => 'someone.else@bar.xy',
    subject    => 'utl_mail test',
    message    => 'This is a test. Does it work?'
  );

end;
/
