create table tq84_number_format (
   fmt  varchar2(20) not null,
   id   number       generated always as identity primary key
);


insert into tq84_number_format (fmt) values (  '9999999999'    );
insert into tq84_number_format (fmt) values (  '9999999999.999');
insert into tq84_number_format (fmt) values (  '9999999990.099');
insert into tq84_number_format (fmt) values ('FM9999999990.099');
insert into tq84_number_format (fmt) values ( 'S9999999990.099');
insert into tq84_number_format (fmt) values ( 'S0000000000.999');
insert into tq84_number_format (fmt) values ( 'S9999999999.999');
insert into tq84_number_format (fmt) values ('TMe'             );
insert into tq84_number_format (fmt) values ('TM9'             );
insert into tq84_number_format (fmt) values ('9.9EEEE'         );
insert into tq84_number_format (fmt) values ('999,999,999'     );
insert into tq84_number_format (fmt) values ('999,999,999.99'  );
insert into tq84_number_format (fmt) values ('000,000,000.00'  );
insert into tq84_number_format (fmt) values ('000,000,009.00'  );
insert into tq84_number_format (fmt) values ('RN'              );
insert into tq84_number_format (fmt) values ('XXXXXX'          );
insert into tq84_number_format (fmt) values ('B99,999,999.00'  );
insert into tq84_number_format (fmt) values ('99999V99'        );

column n1 format a18
column n2 format a18
column n3 format a18
column n4 format a18
column n5 format a18

select
   fmt,
  '>' ||  to_char(       0.7   , fmt) || '<' n1,
  '>' ||  to_char(      42     , fmt) || '<' n2,
  '>' ||  to_char(     123.4   , fmt) || '<' n3,
  '>' ||  to_char( 1222333.444 , fmt) || '<' n4,
  '>' ||  to_char(     -17.1717, fmt) || '<' n5
from
   tq84_number_format
order by
   id;
--
-- FMT                  N1                 N2                 N3                 N4                 N5
-- -------------------- ------------------ ------------------ ------------------ ------------------ ------------------
-- 9999999999           >          1<      >         42<      >        123<      >    1222333<      >        -17<
-- 9999999999.999       >           .700<  >         42.000<  >        123.400<  >    1222333.444<  >        -17.172<
-- 9999999990.099       >          0.700<  >         42.000<  >        123.400<  >    1222333.444<  >        -17.172<
-- FM9999999990.099     >0.7<              >42.0<             >123.4<            >1222333.444<      >-17.172<
-- S9999999990.099      >         +0.700<  >        +42.000<  >       +123.400<  >   +1222333.444<  >        -17.172<
-- S0000000000.999      >+0000000000.700<  >+0000000042.000<  >+0000000123.400<  >+0001222333.444<  >-0000000017.172<
-- S9999999999.999      >          +.700<  >        +42.000<  >       +123.400<  >   +1222333.444<  >        -17.172<
-- TMe                  >7E-01<            >4.2E+01<          >1.234E+02<        >1.222333444E+06<  >-1.71717E+01<
-- TM9                  >.7<               >42<               >123.4<            >1222333.444<      >-17.1717<
-- 9.9EEEE              >  7.0E-01<        >  4.2E+01<        >  1.2E+02<        >  1.2E+06<        > -1.7E+01<
-- 999,999,999          >           1<     >          42<     >         123<     >   1,222,333<     >         -17<
-- 999,999,999.99       >            .70<  >          42.00<  >         123.40<  >   1,222,333.44<  >         -17.17<
-- 000,000,000.00       > 000,000,000.70<  > 000,000,042.00<  > 000,000,123.40<  > 001,222,333.44<  >-000,000,017.17<
-- 000,000,009.00       > 000,000,000.70<  > 000,000,042.00<  > 000,000,123.40<  > 001,222,333.44<  >-000,000,017.17<
-- RN                   >              I<  >           XLII<  >         CXXIII<  >###############<  >###############<
-- XXXXXX               >      1<          >     2A<          >     7B<          > 12A6BD<          >#######<
-- B99,999,999.00       >           .70<   >         42.00<   >        123.40<   >  1,222,333.44<   >        -17.17<
-- 99999V99             >      70<         >    4200<         >   12340<         >########<         >   -1717<

drop table tq84_number_format;
