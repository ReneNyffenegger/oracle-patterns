declare

    c_mailserver constant varchar2(100) := 'mailserver.foo.bar.baz';
    c_from_user  constant varchar2(100) := 'foo@bar.yy';
    c_recpient   constant varchar2(100) := 'scott@tiger.ch';
    c_auth_pw    constant varchar2(100) := 'mySecretPassword';
    c_port       constant number        :=  587;

    v_connection      utl_smtp.connection;

begin

    v_connection := utl_smtp.open_connection(c_mailserver, c_port);

--  Note: ehlo instead of helo
    utl_smtp.ehlo(v_connection, c_mailserver);

    utl_smtp.command(v_connection, 'AUTH LOGIN');
    utl_smtp.command(v_connection, utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(c_from_user))));
    utl_smtp.command(v_connection, utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(c_auth_pw  )))); 

    utl_smtp.mail(v_connection, c_from_user);

    utl_smtp.rcpt(v_connection, c_recpient);

    utl_smtp.open_data(v_connection);

    utl_smtp.write_data(v_connection, 'From: "Name Sender" <'  || c_from_user || '>' || utl_tcp.crlf);
    utl_smtp.write_data(v_connection, 'To: "Name Recipient" <' || c_recpient  || '>' || utl_tcp.crlf);
    utl_smtp.write_data(v_connection, 'Subject: Test Mail'                           || utl_tcp.crlf);

    utl_smtp.write_data(v_connection, utl_tcp.crlf);

    utl_smtp.write_data(v_connection, 'Foo bar baz'      || utl_tcp.crlf);
    utl_smtp.write_data(v_connection, 'one, two, three.' || utl_tcp.crlf);

    utl_smtp.close_data(v_connection);
    utl_smtp.quit(v_connection);

end;
/

