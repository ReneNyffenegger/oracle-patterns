@spool simple-html-document.html

declare
  procedure o(h varchar2) is -- {
  begin
    dbms_output.put_line(h);
  end o; -- }
begin

  o(htf.htmlopen);

  o(htf.  headopen);
  o(htf.    title('Simple HTML Document'));
  o(htf.  headclose);

  o(htf.  bodyopen);
  o(htf.    header(1, 'Hello World'));
  o(htf.    para);
  o(       'The number is: 42');
  o(htf.    para);
  o(       'New paragraph');
  o(htf.  bodyclose);

  o(htf.htmlclose);

end;
/

@spool_off
