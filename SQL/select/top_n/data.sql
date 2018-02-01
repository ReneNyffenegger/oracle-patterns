create table top_n_test (
  num   number  ( 2),
  txt   varchar2(10),
  lng   varchar2( 2) not null check (lng in ('en', 'de', 'fr'))
);

insert into top_n_test values (4, 'vier'   , 'de');
insert into top_n_test values (1, 'one'    , 'en');
insert into top_n_test values (6, 'six'    , 'en');
insert into top_n_test values (3, 'three'  , 'en');
insert into top_n_test values (8, 'acht'   , 'de');
insert into top_n_test values (9, 'nine'   , 'en');
insert into top_n_test values (2, 'deux'   , 'fr');
insert into top_n_test values (7, 'seven'  , 'en');
insert into top_n_test values (3, 'drei'   , 'de') /* Note: second record with num=3 */;
insert into top_n_test values (5, 'cinque' , 'fr');
