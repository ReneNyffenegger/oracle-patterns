create table tq84_delete_subquery_p (
   id    number    primary key,
   val   varchar2  (10)
);

create table tq84_delete_subquery_c (
  id_p   references tq84_delete_subquery_p,
  col    varchar2(10)
);

---------------------------------------------------------

insert into tq84_delete_subquery_p values (1, 'one'     );
insert into tq84_delete_subquery_p values (2, 'two'     );
insert into tq84_delete_subquery_p values (3, 'three'   );
insert into tq84_delete_subquery_p values (4, 'four'    );

---------------------------------------------------------

insert into tq84_delete_subquery_c values (1, 'foo'     );
insert into tq84_delete_subquery_c values (1, 'bar'     );
insert into tq84_delete_subquery_c values (1, 'baz'     );

insert into tq84_delete_subquery_c values (2, 'apple'   );
insert into tq84_delete_subquery_c values (2, 'orange'  );
insert into tq84_delete_subquery_c values (2, 'pear'    );

insert into tq84_delete_subquery_c values (3, 'New York');
insert into tq84_delete_subquery_c values (3, 'Paris'   );
insert into tq84_delete_subquery_c values (3, 'Berlin'  );

insert into tq84_delete_subquery_c values (4, 'Mark'    );
insert into tq84_delete_subquery_c values (4, 'Joe'     );
insert into tq84_delete_subquery_c values (4, 'Susan'   );

---------------------------------------------------------


delete from (
  select * from 
    tq84_delete_subquery_p p join 
    tq84_delete_subquery_c c on p.id = c.id_p
  where
    c.col like '%o%'
);

select * from tq84_delete_subquery_c;

---------------------------------------------------------

drop table tq84_delete_subquery_c purge;
drop table tq84_delete_subquery_p purge;
