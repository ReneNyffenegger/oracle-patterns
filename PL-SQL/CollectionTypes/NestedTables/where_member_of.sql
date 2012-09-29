create table tq84_member_of (
  id   number primary key,
  txt  varchar2(10)
);

insert into tq84_member_of values (1, 'one'  );
insert into tq84_member_of values (2, 'two'  );
insert into tq84_member_of values (3, 'three');
insert into tq84_member_of values (4, 'four' );

create type tq84_number_tab as table of number;
/


select * from tq84_member_of 
 where id member of tq84_number_tab( 2, 4, 6);

drop type tq84_number_tab;

drop table tq84_member_of;
