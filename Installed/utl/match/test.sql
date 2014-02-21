create table tq84_utl_match (
  s  varchar2(20)
);

insert into tq84_utl_match values ('Rene'    );
insert into tq84_utl_match values ('René'    );
insert into tq84_utl_match values ('Ren'     );
insert into tq84_utl_match values ('rene'    );
insert into tq84_utl_match values ('Rne'     );
insert into tq84_utl_match values ('found'   );
insert into tq84_utl_match values ('pound'   );



select
  a.s,
  b.s,
  utl_match.edit_distance           (a.s, b.s) ed,
  utl_match.edit_distance_similarity(a.s, b.s) eds,
  utl_match.jaro_winkler            (a.s, b.s) jw,
  utl_match.jaro_winkler_similarity (a.s, b.s) jws
from
  tq84_utl_match a cross join
  tq84_utl_match b;



drop table tq84_utl_match purge;
