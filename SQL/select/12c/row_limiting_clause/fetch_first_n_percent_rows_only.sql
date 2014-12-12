create table tq84_table (
  id  number,
  txt varchar2(10)
);

begin

  for r in 1 .. 10000 loop

      insert into tq84_table values (r, dbms_random.string('a', 10));

  end loop;

end;
/

-- select 10 (= 0.1 percent of 10000) records:
select * from tq84_table
order by txt
fetch first 0.1 percent rows only;


drop table tq84_table purge;
