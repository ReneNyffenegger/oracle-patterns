create table tq84_number_format (
   fmt  varchar2(20) not null,
   id   number       generated always as identity primary key
);


insert into tq84_number_format (fmt) values ('999999999'     );
insert into tq84_number_format (fmt) values ('999999999.99'  );
insert into tq84_number_format (fmt) values ('999999990.99'  );
insert into tq84_number_format (fmt) values ('TMe'           );
insert into tq84_number_format (fmt) values ('TM9'           );
insert into tq84_number_format (fmt) values ('9.9EEEE'       );
insert into tq84_number_format (fmt) values ('999,999,999'   );
insert into tq84_number_format (fmt) values ('999,999,999.99');
insert into tq84_number_format (fmt) values ('000,000,000.00');
insert into tq84_number_format (fmt) values ('000,000,009.00');
insert into tq84_number_format (fmt) values ('B99,999,999.00');
insert into tq84_number_format (fmt) values ('S0000000000.99');
insert into tq84_number_format (fmt) values ('S9999999999.99');
insert into tq84_number_format (fmt) values ('99999V99'      );

column n1 format a17
column n2 format a17
column n3 format a17
column n4 format a17
select
   fmt,
  '>' ||  to_char(       0.7   , fmt) || '<' n1,
  '>' ||  to_char(      42     , fmt) || '<' n1,
  '>' ||  to_char(     123.456 , fmt) || '<' n2,
  '>' ||  to_char( 1222333.444 , fmt) || '<' n3,
  '>' ||  to_char(     -17.1717, fmt) || '<' n4
from
   tq84_number_format
order by
   id;



drop table tq84_number_format;
