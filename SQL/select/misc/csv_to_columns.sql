create table tq84_csv_data (
  csv   varchar2(100)
);

insert into tq84_csv_data values ('one,two,three');
insert into tq84_csv_data values ('foo,bar,baz');
insert into tq84_csv_data values ('1,,3');
insert into tq84_csv_data values ('i,ii,');
insert into tq84_csv_data values (' ,**,***');
insert into tq84_csv_data values (',,');

column col_1 format a10
column col_2 format a10
column col_3 format a10

select
  trim(',' from regexp_substr(csv, '[^,]*,' ,1, 1)) col_1,
  trim(',' from regexp_substr(csv, ',[^,]*' ,1, 1)) col_2,
  trim(',' from regexp_substr(csv, ',[^,]*' ,1, 2)) col_3
from
  tq84_csv_data;

drop table tq84_csv_data purge;
