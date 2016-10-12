create table tq84_diff_a (
  a number       primary key,
  c number,
  b varchar2(10)
);

create table tq84_diff_b (
  a number,
  c number,
  b varchar2(12),
  --
  primary key(a, c)
);


declare
  xml_from  clob;
  xml_to    clob;

  res       clob;
  fc        clob;

  hdl       number;
  doc_h1    number;
  doc_h2    number;

begin

  xml_from := dbms_metadata.get_sxml('TABLE', 'TQ84_DIFF_A');
  xml_to   := dbms_metadata.get_sxml('TABLE', 'TQ84_DIFF_B');

  hdl := dbms_metadata_diff.openc('TABLE');

  dbms_metadata_diff.add_document(handle => hdl, document => xml_from);
  dbms_metadata_diff.add_document(handle => hdl, document => xml_to  );

  fc    := dbms_metadata_diff.fetch_clob(hdl);

  dbms_metadata_diff.close(hdl);

  hdl    := dbms_metadata.openw('TABLE');
  doc_h1 := dbms_metadata.add_transform(hdl, 'ALTERXML');
  doc_h2 := dbms_metadata.add_transform(hdl, 'ALTERDDL');

  dbms_lob.createtemporary(res, true);
  dbms_metadata.convert(hdl, fc , res);
  dbms_metadata.close(hdl);

  dbms_output.put_line(res);

end;
/


drop table tq84_diff_a purge;
drop table tq84_diff_b purge;
