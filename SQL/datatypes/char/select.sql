create table tq84_char( ch6 char(6) );

insert into tq84_char values ('foo'   );
insert into tq84_char values ('bazbar');

commit;

select * from tq84_char where ch6 = 'foo'  ; /* Returns one record */
select * from tq84_char where ch6 = 'foo ' ; /* Returns one record */
select * from tq84_char where ch6 = ' foo '; /* Returns no  record */

drop table tq84_char purge;
