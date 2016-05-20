create table tq84_temporary_clob(c clob);

declare
  c_   clob;
begin
  dbms_lob.createtemporary(c_, false);

  dbms_lob.append(c_, 'foo');


  insert into tq84_temporary_clob values (c_);
end;
/

select * from tq84_temporary_clob;

drop table tq84_temporary_clob;
