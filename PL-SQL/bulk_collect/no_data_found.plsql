create type tq84_bulk_collect_tab as table of varchar2(100);
/

create table tq84_bulk_collect_table (
  col1 number,
  col2 varchar2(100)
);

insert into tq84_bulk_collect_table values (1, 'one');
insert into tq84_bulk_collect_table values (2, 'two');
insert into tq84_bulk_collect_table values (3, 'three');


declare

  b  tq84_bulk_collect_tab;

begin

  select col2 bulk collect into b 
    from tq84_bulk_collect_table 
   where col1 > 100; -- No records match!

   dbms_output.put_line ('b.count: ' || b.count);

exception when no_data_found then

-- Not reached:
   dbms_output.put_line ('no_data_found');

end;
/

drop table tq84_bulk_collect_table purge;
drop type  tq84_bulk_collect_tab;
