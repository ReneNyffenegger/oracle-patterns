declare
--
--  ORA-24248: XML DB extensible security not installed:
--  ---------------------------------------------------
--
--  The following statement probably finds no record, indicating
--  that «Oracle XML Database» is not installed.
--
--      select status from dba_registry where comp_name = 'Oracle XML Database';
--
--  Installing the «Oracle XML Database»:
--
--      sqlplus / as sysdba
--      spool install_xml_db.log
--      @?/rdbms/admin/catqm xdb users temp NO
--                           ^   ^     ^    ^
--                           |   |     |    |
--                           |   |     |    +-- use secure files
--                           |   |     |
--                           |   |     +------- temporary tablespace name
--                           |   |
--                           |   +------------- tablespace name
--                           |
--                           +----------------- xdb password
--

    c_mailserver constant varchar2(100) := 'mailserver.foo.bar.baz';
    c_port       constant number        :=  25;

    v_connection      utl_smtp.connection;

begin

    v_connection := utl_smtp.open_connection(c_mailserver, c_port);

    utl_smtp.helo(v_connection, c_mailserver );
    utl_smtp.mail(v_connection, 'me@somewhere.foo.bar'  );
    utl_smtp.rcpt(v_connection, 'scott.tiger@oracle.com');

    utl_smtp.open_data(v_connection);

    utl_smtp.write_data(v_connection, 'From: "René" <me@somewhere.foo.bar>'         || utl_tcp.crlf);
    utl_smtp.write_data(v_connection, 'To: "Scott Tiger" <scott.tiger@oracle.com>'  || utl_tcp.crlf);
    utl_smtp.write_data(v_connection, 'Subject: Test Mail'                          || utl_tcp.crlf);

    utl_smtp.write_data(v_connection,utl_tcp.crlf);

    utl_smtp.write_data(v_connection, 'Foo bar baz'      || utl_tcp.crlf);
    utl_smtp.write_data(v_connection, 'one, two, three.' || utl_tcp.crlf);

    utl_smtp.close_data(v_connection);
    utl_smtp.quit(v_connection);
end;
/
