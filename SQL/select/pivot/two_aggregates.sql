create table tq84_two_aggregates (
       item    varchar2(20)  not null,
       region  varchar2( 5)  not null check (region in ('North', 'South', 'West', 'East')),
       price   number,
       sold    number,
       foo     varchar2(2)
);



insert into tq84_two_aggregates values ('Apple', 'North',    0.85,   1094, '?' );
insert into tq84_two_aggregates values ('Apple', 'South',    0.79,     88, '!!');
insert into tq84_two_aggregates values ('Apple', 'West' ,    0.81,    203, '%' );

insert into tq84_two_aggregates values ('Pear' , 'North',    1.05,   4593, '#-');
insert into tq84_two_aggregates values ('Pear' , 'South',    0.98,   5010, '/' );
insert into tq84_two_aggregates values ('Pear' , 'East' ,    1.03,    912, '\\');

insert into tq84_two_aggregates values ('Mango', 'South',    2.44,    417, '_/');

-- update tq84_two_aggregates set foo = '1';


select * from (
  select item, price, sold, /* foo,*/ region from tq84_two_aggregates
)
pivot (
  sum(sold)   as sold ,
  max(price)  as price
  --
  for region in ('North' as north_, 'South' as south_, 'West' as west_, 'East' as east_)
)
;

drop table tq84_two_aggregates purge;
