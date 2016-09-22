drop   table tq84_abc purge;
create table tq84_abc (
  gr  varchar2(5),
  v1  number
);

insert into tq84_abc values ('AAA', 5);
insert into tq84_abc values ('AAA', 5);

insert into tq84_abc values ('AAA', 7);

insert into tq84_abc values ('AAA', 9);
insert into tq84_abc values ('AAA', 9);

---------------------------------------

insert into tq84_abc values ('ZZZ', 6);
insert into tq84_abc values ('ZZZ', 6);

insert into tq84_abc values ('ZZZ', 7);

insert into tq84_abc values ('ZZZ', 8);

select
  count(distinct gr),
  count(distinct v1),
  avg  (distinct v1)
from
  tq84_abc;
--
-- COUNT(DISTINCTGR) COUNT(DISTINCTV1) AVG(DISTINCTV1)
-- ----------------- ----------------- ---------------
--
                2                 5               7

select
  gr,
  count(distinct v1),
  avg  (distinct v1)
from
  tq84_abc
group by
  gr;

-- GR    COUNT(DISTINCTV1) AVG(DISTINCTV1)
-- ----- ----------------- ---------------
-- AAA                   3               7
-- ZZZ                   3               7
