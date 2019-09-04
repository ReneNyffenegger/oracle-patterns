drop table spending;

create table spending (
   item  varchar(50) not null,
   price decimal(5,2)
);

insert into spending values ('Something very expensive', 85.13);
insert into spending values ('Averagely priced'        , 63.18);
insert into spending values ('Way too cheap'           ,  9.99);

select
   item,
   price,
   to_char(
      ratio_to_report(price) over () * 100,
     '99.9'
   ) || '%' as pct
from
   spending
;

-- ITEM                             PRICE PCT
-- --------------------------- ---------- ------
-- Something very expensive         85.13  53.8%
-- Averagely priced                 63.18  39.9%
-- Way too cheap                     9.99   6.3%

drop table spending;
