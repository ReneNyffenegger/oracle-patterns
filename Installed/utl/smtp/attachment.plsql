declare

  mailserver  varchar2(100) := '&1';
  port        number        :=  &2 ;
  from_addr   varchar2(100) := '&3';
  to_addr     varchar2(100) := '&4';
  auth_pw     varchar2(100) := '&5';
  from_name   varchar2(100) := '&6';

  smtp_conn   utl_smtp.connection;


  c_seperator constant varchar2(20) := 'abcdefghijklmnoprstu';

  procedure auth_login( -- {
               smtp      in out utl_smtp.connection,
               username  in     varchar2,
               password  in     varchar2) is
  begin

    utl_smtp.command(smtp, 'AUTH LOGIN');
    utl_smtp.command(smtp, utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(username))));
    utl_smtp.command(smtp, utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(password)))); 

  end auth_login; -- }

  procedure header ( -- {
               smtp            in out utl_smtp.connection,
               mail_addr_from  in     varchar2,
               mail_addr_to    in     varchar2,
               subject         in     varchar2)
  is
  begin

    utl_smtp.write_data(smtp_conn, 'Date: ' || to_char(sysdate, 'dd-mon-yyyy hh24:mi:ss') || utl_tcp.crlf);
    utl_smtp.write_data(smtp_conn, 'To: ' || mail_addr_to || utl_tcp.crlf);
    utl_smtp.write_data(smtp_conn, 'From: ' || mail_addr_from || utl_tcp.crlf);
    utl_smtp.write_data(smtp_conn, 'Subject: ' || subject || utl_tcp.crlf);
    utl_smtp.write_data(smtp_conn, 'reply-to: ' || from_addr || UTL_TCP.crlf);
    utl_smtp.write_data(smtp_conn, 'MIME-Version: 1.0' || utl_tcp.crlf);
    utl_smtp.write_data(smtp_conn, 'Content-Type: multipart/mixed; boundary="' || c_seperator || '"' || utl_tcp.crlf || utl_tcp.crlf);

  end header; -- }

  function png_blob return blob is -- {
  begin
    
    return hextoraw(
         '89504e470d0a1a0a0000000d49484452' ||
         '000000c8000000c80802000000223a39' ||
         'c9000000097048597300000b1300000b' ||
         '1301009a9c180000000774494d4507df' ||
         '0a140b2a122af08eb20000001d695458' ||
         '74436f6d6d656e740000000000437265' ||
         '6174656420776974682047494d50642e' ||
         '6507000001764944415478daedd2310d' ||
         '004008c0c0e795a3170f24986060b893' ||
         'd034b2fac1b62f01c6c258180b8c85b1' ||
         '3016180b63612c3016c6c258602c8c85' ||
         'b1c058180b6381b13016c60263612c8c' ||
         '05c6c258180b8c85b13016180b63612c' ||
         '3016c6c258602c8c85b1c058180b6381' ||
         'b13016c60263612c8c05c6c258180b8c' ||
         '85b13016180b63612c3016c6c258602c' ||
         '8c85b1c058180b6381b13016c6026361' ||
         '2c8c05c6c258180b8c85b13016180b63' ||
         '612c3016c6c258602c8c85b13016180b' ||
         '63612c3016c6c258602c8c85b1c05818' ||
         '0b6381b13016c60263612c8c05c6c258' ||
         '180b8c85b13016180b63612c3016c6c2' ||
         '58602c8c85b1c058180b6381b13016c6' ||
         '0263612c8c05c6c258180b8c85b13016' ||
         '180b63612c3016c6c258602c8c85b1c0' ||
         '58180b6381b13016c60263612c8c05c6' ||
         'c258180b8c85b13016180b63612c3016' ||
         'c6c258602c8c85b1c058180b63612c30' ||
         '16c6c258602c8c85b1c058180b6381b1' ||
         '3016c60263612c8c05c6c258180b8c85' ||
         'b13016180b63612c3016d70cf3dd03f7' ||
         '3dd25a720000000049454e44ae426082');

  end png_blob; -- }

  procedure html(smtp in out  utl_smtp.connection, -- {
                 html in      varchar2) is
  begin

    utl_smtp.write_data(smtp, '--' || c_seperator || utl_tcp.crlf);
    utl_smtp.write_data(smtp, 'Content-Type: text/html' || utl_tcp.crlf || utl_tcp.crlf);

    utl_smtp.write_data(smtp, html);

    utl_smtp.write_data(smtp, utl_tcp.crlf || utl_tcp.crlf);

    return;

  end html; -- }

  procedure attachment( -- {
    smtp     in out utl_smtp.connection,
    filename in     varchar2, 
    content  in blob) is

    c_step   constant pls_integer  := 12000; -- Multiple of 3, not higher than 24573

  begin

    utl_smtp.write_data(smtp, '--' || c_seperator || utl_tcp.crlf);
    utl_smtp.write_data(smtp, 'Content-Type: application/octet-stream; name="' || filename || '"' || utl_tcp.crlf);
    utl_smtp.write_data(smtp, 'Content-Transfer-Encoding: base64' || UTL_TCP.crlf);
    utl_smtp.write_data(smtp, 'Content-Disposition: attachment; filename="' || filename || '"' || utl_tcp.crlf || utl_tcp.crlf);
  
    for i in 0 .. trunc((dbms_lob.getlength(content) - 1 )/c_step) loop
      utl_smtp.write_data(smtp, utl_raw.cast_to_varchar2(utl_encode.base64_encode(DBMS_LOB.substr(content, c_step, i * c_step + 1))));
    end loop;
  
    utl_smtp.write_data(smtp, utl_tcp.crlf || utl_tcp.crlf);


  end attachment; -- }

  procedure end_mail( -- {
    smtp     in out utl_smtp.connection
  ) is
  begin

    utl_smtp.write_data(smtp, '--' || c_seperator || '--' || utl_tcp.crlf);
    utl_smtp.close_data(smtp);
  
    utl_smtp.quit(smtp);

  end end_mail; -- }

begin
  
  smtp_conn := utl_smtp.open_connection(mailserver, port);

  utl_smtp.ehlo(smtp_conn, mailserver );

  auth_login(smtp_conn, from_addr, auth_pw);
  
  utl_smtp.mail(smtp_conn, from_addr  );
  utl_smtp.rcpt(smtp_conn, to_addr    );

  utl_smtp.open_data(smtp_conn);

  header( -- {
    smtp_conn,
    mail_addr_from  => from_addr,
    mail_addr_to    => to_addr,
    subject         =>'/// Test mail with attachment ///'
  ); -- }
  
  html(smtp_conn, q'{<html><head><title>Test with Attachment</title>
   <style type='text/css'>
     * { font-family: Garamond; }
     body {background-color: #eeeeff}
   </style>
 </head>
 <body>

 <h1>A H1 Heading</h1>

 And some text
 <p>More text
 <p>And some bullets<ul>
   <li>foo
   <li>bar
   <li>zaz
 </ul>

</body>
</html>
  }');

  attachment(smtp_conn, 'a.png', png_blob());

  end_mail(smtp_conn);

end;
/
  
