drop table tq84_c purge;
drop table tq84_p purge;

create table tq84_p (
  col_ix_1 varchar2(10) not null,
  col_ix_2 varchar2(10)     null,
  col_data varchar2(10),
  --
  constraint tq84_p_ix unique (col_ix_1, col_ix_2)
);

create table tq84_c (
  id  number,
  col_fk_1 not null,
  col_fk_2     null,
  -- ---------------------------------------------------------------------------------------
  -- Foreign keys can be created to unique indexes (instead of primary keys):
  --
  constraint tq84_fk foreign key (col_fk_1, col_fk_2) references tq84_p (col_ix_1, col_ix_2)
  -- ---------------------------------------------------------------------------------------
);

desc tq84_c;
-- Name     Null     Typ          
-- -------- -------- ------------ 
-- ID                NUMBER       
-- COL_FK_1 NOT NULL VARCHAR2(10) 
-- COL_FK_2          VARCHAR2(10)
--

insert into tq84_p values ('foo' , 'bar',    'baz'   );
insert into tq84_p values ('null',  null,    'null'  );
insert into tq84_p values ('null', 'null', '''null''');

select * from tq84_p;

insert into tq84_c values (1, 'foo' , 'bar');
insert into tq84_c values (2, 'null', 'null');
insert into tq84_c values (3, 'null',  null);

-- ----------------------------------------------------------------
-- This record cannot be inserted because the values 'bla', 'bla'
-- don't exist in the parent table:
--
insert into tq84_c values (4, 'bla' ,  'bla');

-- ----------------------------------------------------------------
-- However, this record CAN be inserted because null values are
-- not checked:
--
insert into tq84_c values (5, 'bla' ,  null);
