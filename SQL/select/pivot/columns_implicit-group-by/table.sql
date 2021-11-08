drop   table tq84_pivot_test;

create table tq84_pivot_test (
   id      number,
   col_1   varchar2(5),
   col_2   varchar2(5),
   col_3   varchar2(5),
   val_1   number,
   val_2   varchar2(5)
);

insert into tq84_pivot_test values (1, 'A', 'X', 'v', 8, 'one'  );
insert into tq84_pivot_test values (2, 'A', 'X', 'v', 9, 'two'  );
insert into tq84_pivot_test values (3, 'B', 'Y', 'v', 2, 'three');
insert into tq84_pivot_test values (4, 'B', 'Y', 'v', 7, 'four' );
insert into tq84_pivot_test values (5, 'A', 'Y', 'v', 5, 'five' );
insert into tq84_pivot_test values (6, 'B', 'Y', 'w', 4, 'six'  );
insert into tq84_pivot_test values (7, 'B', 'Y', 'w', 1, 'seven');
insert into tq84_pivot_test values (8, 'C', 'Z', 'w', 6, 'eight' );
