create table tq84_top_n (
  id   number primary key,
  txt  varchar2(100)
);

insert into tq84_top_n  values (7, 'seven');
insert into tq84_top_n  values (9, 'nine' );
insert into tq84_top_n  values (5, 'five' );
insert into tq84_top_n  values (2, 'two'  );
insert into tq84_top_n  values (4, 'four' );
insert into tq84_top_n  values (8, 'eight');
insert into tq84_top_n  values (1, 'one'  );
insert into tq84_top_n  values (6, 'six'  );
insert into tq84_top_n  values (3, 'three');

--
--   Will very likely not return what one things:
--
select * from tq84_top_n
  where rownum < 5
  order by id;


prompt
prompt
prompt    With inner query and rownum
prompt    ===========================
prompt

select * from (
  select * from tq84_top_n
    order by id
)
where rownum < 5;

prompt
prompt
prompt    With inner query and row_number()
prompt    =================================
prompt

select id, txt from (
  select 
    id, txt,
    row_number() over (order by id) r
  from tq84_top_n
)
where r < 5;

drop table tq84_top_n purge;
