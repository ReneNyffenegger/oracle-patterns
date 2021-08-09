create table tq84_data (
   category    varchar2(10),
   item        varchar2(10),
   price       number
);

insert into tq84_data values ('fruits', 'apple'  , 1.17);
insert into tq84_data values ('fruits', 'banana' , 2.03);
insert into tq84_data values ('fruits', 'cherry' , 2.51);

insert into tq84_data values ('meals' , 'burger' , 8.99);
insert into tq84_data values ('meals' , 'hot dog', 3.99);

select
   category,
   json_objectagg(
      key    item
      value  price
   )                item_prices
from
   tq84_data
group by
   category;

-- CATEGORY   ITEM_PRICES
-- --------   ------------------------------------------
-- fruits     {"apple":1.17,"cherry":2.51,"banana":2.03}
-- meals      {"burger":8.99,"hot dog":3.99}

drop table tq84_data;
