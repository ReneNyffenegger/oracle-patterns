create table tq84_joining_columns (
  col_a  varchar2(10),
  col_b  varchar2(10),
  col_c  varchar2(10)
);


insert into tq84_joining_columns values ('foo', 'bar', 'baz');
insert into tq84_joining_columns values ('one', 'two',  null);
insert into tq84_joining_columns values ('abc',  null, 'def');
insert into tq84_joining_columns values ('ghi',  null,  null);
insert into tq84_joining_columns values ( null, 'jkl', 'mno');
insert into tq84_joining_columns values ( null, 'pqr',  null);
insert into tq84_joining_columns values ( null,  null, 'stu');
insert into tq84_joining_columns values ( null,  null,  null);


select
  trim(both ',' from
    regexp_replace( 
      col_a || ',' || col_b || ',' || col_c,
      ',+',
      ','
    )
  )
from
  tq84_joining_columns;



drop table tq84_joining_columns purge;
