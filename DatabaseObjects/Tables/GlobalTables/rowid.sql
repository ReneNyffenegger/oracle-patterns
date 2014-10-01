create global temporary table tq84_gtt (
  a number,
  b varchar2(10)
);

insert into tq84_gtt values (1, 'one');
insert into tq84_gtt values (2, 'two');
insert into tq84_gtt values (3, 'three');
insert into tq84_gtt values (4, 'four');


begin

  for r in (select rowid, b from tq84_gtt) loop

      update tq84_gtt set b = upper(r.b) where rowid = r.rowid;

  end loop;

end;
/

select * from tq84_gtt;

drop table tq84_gtt purge;
