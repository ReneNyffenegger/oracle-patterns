create table tq84_relations (
   item         varchar2(30) primary key,
   parent_item  varchar2(30) references tq84_relations
);


insert into tq84_relations values ('a-c'          , null);

insert into tq84_relations values(   'A'          , 'a-c');
insert into tq84_relations values(     'abc'      , 'A'  );
insert into tq84_relations values(     'def'      , 'A'  );
insert into tq84_relations values(     'ghi'      , 'A'  );

insert into tq84_relations values(   'B'          , 'a-c');
insert into tq84_relations values(     'jkl'      , 'B'  );

insert into tq84_relations values(   'C'          , 'a-c');
insert into tq84_relations values(     'mno'      , 'C'  );
insert into tq84_relations values(     'pqr'      , 'C'  );
insert into tq84_relations values(         '###'  , 'pqr');
insert into tq84_relations values(         '!!!'  , 'pqr');

insert into tq84_relations values ('d-e'          , null);

insert into tq84_relations values(   'D'          , 'd-e');

insert into tq84_relations values(   'E'          , 'd-e');
insert into tq84_relations values(     '123'      , 'E'  );
insert into tq84_relations values(     '456'      , 'E'  );


with recursion 
  (item, path)  -- Column alias list. Needed to prevent «ORA-32039: recursive WITH clause must have column alias list»
as (
  -- Anchor:
     select item, item from tq84_relations where parent_item is null 
  UNION ALL -- recursion: ------------------------------------
      select myself.item, parent.item || ' -> ' || myself.item 
      from recursion parent join 
           tq84_relations myself on parent.item = myself.parent_item
)
-------------------------------------------------------
search depth first by item set column_name_for_ordering
-------------------------------------------------------
select 
  column_name_for_ordering, 
  path 
from recursion;

drop table tq84_relations;
