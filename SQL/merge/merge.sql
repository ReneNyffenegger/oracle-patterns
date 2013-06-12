create table tq84_merge_source (
  col1       number,
  col2       varchar2(10)
);

create table tq84_merge_destination (
  col1       number,
  col2       varchar2(10)
);
insert into tq84_merge_source values ( 1, 'one'   ); 
insert into tq84_merge_source values ( 2, 'two'   ); 
insert into tq84_merge_source values ( 3, 'three' ); 
insert into tq84_merge_source values ( 4, 'four'  ); 
insert into tq84_merge_source values ( 5, 'five'  ); 
insert into tq84_merge_source values ( 6, 'six'   ); 
insert into tq84_merge_source values ( 7, 'seven' ); 
insert into tq84_merge_source values ( 8, 'eight' ); 
insert into tq84_merge_source values ( 9, 'nine'  ); 
insert into tq84_merge_source values (10, 'ten'   ); 

insert into tq84_merge_destination values ( 1, '***');
insert into tq84_merge_destination values ( 6, 'six');
insert into tq84_merge_destination values ( 8, '!!!');


merge into tq84_merge_destination       dest
using (select * from tq84_merge_source) src
on (dest.col1 = src.col1)
when matched then
     update set dest.col2 = src.col2
when not matched then
     insert (dest.col1, dest.col2) values (src.col1, src.col2);


select * from tq84_merge_destination order by col1;

drop table tq84_merge_source;
drop table tq84_merge_destination;
