create table tq84_where_in (
   col_1   number,
   col_2   varchar2(20),
   col_3   varchar2(20)
);


insert into tq84_where_in values (1, 'en', 'one'  );
insert into tq84_where_in values (2, 'en', 'two'  );
insert into tq84_where_in values (3, 'en', 'three');

insert into tq84_where_in values (1, 'de', 'eins' );
insert into tq84_where_in values (2, 'de', 'zwei' );
insert into tq84_where_in values (3, 'de', 'drei' );

insert into tq84_where_in values (3, null, '!!!!' );


select * from tq84_where_in where col_1 in (1,2);
--
--        COL_1 COL_2                COL_3
--   ---------- -------------------- --------------------
--            1 en                   one
--            2 en                   two
--            1 de                   eins
--            2 de                   zwei
--

select * from tq84_where_in where (col_1, col_2) in ( (1, 'en'),  -- Note, the 3, null, '!!!!' record is not selected!
                                                      (2, 'de'),
                                                      (3, 'en'),
                                                      (3, null)
                                                    );

--   
--        COL_1 COL_2                COL_3
--   ---------- -------------------- --------------------
--            1 en                   one
--            3 en                   three
--            2 de                   zwei
--   
--   

drop table tq84_where_in purge;
