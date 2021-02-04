create table parse_test_one (
   id    integer primary key,
   num_1 number,
   txt_1 varchar2(10)
);

create table parse_test_two (
   id_one   integer references parse_test_one,
   num_2    number,
   txt_2    varchar2(10)
);


set lines 9999

declare
   parsed clob;

begin
   sys.dbms_lob.createTemporary(parsed, true);

   utl_xml_wrapper.parseQuery(
      sys_context('userenv', 'current_userid'),
      user,
     'select
        a.*,
        a.num_1 +  b.num_2  as total,
        a.txt_1 || b.txt_2  as text
      from
        parse_test_one a                       left join
        parse_test_two b on a.id = b.id_one
     ',
      parsed);

   dbms_output.put_line(parsed);

   sys.dbms_lob.freetemporary(parsed);
end;
/

drop table parse_test_two purge;
drop table parse_test_one purge;
