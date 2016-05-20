create table tq84_blob_1 (
   id number,
   bl blob
);

create table tq84_blob_2 (
   id number,
   bl blob
);


declare

  b  blob;

begin

  insert into tq84_blob_1 values (1, empty_blob()) returning bl into b;

  for i in 1 .. 1000 loop
      dbms_lob.append (b, utl_raw.cast_to_raw(rpad ('-', 1000, '-')));
  end loop;

  update tq84_blob_1 set bl = b where id = 1;

end;
/

insert into tq84_blob_2 select * from tq84_blob_1;

-- select * from tq84_blob_2;

declare

  b  blob;

begin

  select bl into b from tq84_blob_2 where id = 1;

  dbms_output.put_line('The length of the blob is: ' || to_char(dbms_lob.getLength(b), '999G999G999'));

end;
/


drop table tq84_blob_1 purge;
drop table tq84_blob_2 purge;


