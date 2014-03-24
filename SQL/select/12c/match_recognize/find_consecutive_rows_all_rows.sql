
create table tq84_consecutive_rows (
   id   number,
   txt  varchar2(20)
);


insert into tq84_consecutive_rows values ( 1, 'one'    );
insert into tq84_consecutive_rows values ( 2, 'two'    );
insert into tq84_consecutive_rows values ( 3, 'three'  );

insert into tq84_consecutive_rows values ( 5, 'five'   );

insert into tq84_consecutive_rows values ( 8, 'eight'  );
insert into tq84_consecutive_rows values ( 9, 'nine'   );
insert into tq84_consecutive_rows values (10, 'ten'    );
insert into tq84_consecutive_rows values (11, 'eleven' );

insert into tq84_consecutive_rows values (20, 'twenty' );

select * from  tq84_consecutive_rows
match_recognize (
  order by id
  measures
    first(id)         start_id,
    final last(id)      end_id
  all rows per match
  pattern (R C*)
  define C as id = prev(id) + 1
);


drop table tq84_consecutive_rows purge;
