drop table T_ID_1 purge;
drop table T_ID_2 purge;
drop table T_ID_3 purge;

create table T_ID_1 (id number generated always             as identity, txt varchar2(20));
create table T_ID_2 (id number generated by default         as identity, txt varchar2(20));
create table T_ID_3 (id number generated by default on null as identity, txt varchar2(20));

-- Cannot insert into ORA-32795: cannot insert into a generated always identity column
-- insert into T_ID_1 values (10  , 'ten'       );
-- insert into T_ID_1 values (null, 'eleven'    );
insert into T_ID_1 (txt) values ('twelve'    );
insert into T_ID_1 (txt) values ('thirteen'  );

insert into T_ID_2 values (2   , 'twenty'    );
-- ORA-01400: cannot insert NULL into ("RENE"."T_ID_2"."ID")
-- insert into T_ID_2 values (null, 'twenty-one');
insert into T_ID_2 (txt) values ('twenty-two'  );
insert into T_ID_2 (txt) values ('twenty-three');

insert into T_ID_3 values       ( 3  , 'thirty'      );
insert into T_ID_3 values       (null, 'thirty-one'  );
insert into T_ID_3 (txt) values (      'thirty-two'  );
insert into T_ID_3 values       (      'thirty-three');
insert into T_ID_3 (txt) values (      'thirty-four' );

select * from T_ID_1;
--
--         ID TXT
-- ---------- --------------------
--          1 twelve
--          2 thirteen

select * from T_ID_2;
--
--         ID TXT
-- ---------- --------------------
--          2 twenty
--          1 twenty-two
--          2 twenty-three

select * from T_ID_3;
--
--         ID TXT
-- ---------- --------------------
--          3 thirty
--          1 thirty-one
--          2 thirty-two
--          3 thirty-four