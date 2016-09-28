create table tq84_hier_relation (
  id         number primary key,
  id_parent  references tq84_hier_relation
);

create table tq84_hier_description (
  id_rel  number, -- references tq84_hier_relation,
  lang    varchar2( 2),
  text    varchar2(30),
  --
  primary key(lang, text)
);

-- {

insert into tq84_hier_relation       values ( 1, null);
  insert into tq84_hier_relation     values ( 2,    1);
  insert into tq84_hier_relation     values ( 3,    1);
    insert into tq84_hier_relation   values ( 5,    3);
      insert into tq84_hier_relation values ( 7,    5);
    insert into tq84_hier_relation   values ( 6,    3);
  insert into tq84_hier_relation     values ( 4,    1);
insert into tq84_hier_relation       values ( 8, null);
  insert into tq84_hier_relation     values (10,    8);
    insert into tq84_hier_relation   values (11,   10);
    insert into tq84_hier_relation   values (12,   10);
  insert into tq84_hier_relation     values (13,    8);
insert into tq84_hier_relation       values ( 9, null);

--}

-- {


   insert into tq84_hier_description values ( 1, 'de',  'Wurzel A');
   insert into tq84_hier_description values ( 1, 'en',  'Root A'  );
   
   insert into tq84_hier_description values ( 8, 'de',  'Wurzel B');
   insert into tq84_hier_description values ( 8, 'en',  'Root B'  );
   
   insert into tq84_hier_description values ( 9, 'de',  'Wurzel C');
   insert into tq84_hier_description values ( 9, 'en',  'Root C'  );
   
-- insert into tq84_hier_description values ( 2, 'de',  'Stufe 1 A a');
   insert into tq84_hier_description values ( 2, 'en',  'Level 1 A a');
   
   insert into tq84_hier_description values ( 3, 'de',  'Stufe 1 A b');
-- insert into tq84_hier_description values ( 3, 'en',  'Level 1 A b');
   
-- insert into tq84_hier_description values ( 4, 'de',  'Stufe 1 A c');
-- insert into tq84_hier_description values ( 4, 'en',  'Level 1 A c');
   
   insert into tq84_hier_description values (10, 'de',  'Stufe 1 B d');
   insert into tq84_hier_description values (10, 'en',  'Level 1 B d');
   
   insert into tq84_hier_description values (13, 'de',  'Stufe 1 B e');
   insert into tq84_hier_description values (13, 'en',  'Level 1 B e');
   
   insert into tq84_hier_description values ( 5, 'de',  'Stufe 2 A b f');
   insert into tq84_hier_description values ( 5, 'en',  'Level 2 A b f');
   
-- insert into tq84_hier_description values ( 6, 'de',  'Stufe 2 A c g');
   insert into tq84_hier_description values ( 6, 'en',  'Level 2 A c g');
   
   insert into tq84_hier_description values (11, 'de',  'Stufe 2 B d i');
   insert into tq84_hier_description values (11, 'en',  'Level 2 B d i');
   
   insert into tq84_hier_description values (12, 'de',  'Stufe 2 B e j');
   insert into tq84_hier_description values (12, 'en',  'Level 2 B e j');
   
   insert into tq84_hier_description values ( 7, 'de',  'Stufe 3 B e j k');
   insert into tq84_hier_description values ( 7, 'en',  'Level 3 B e j k');

-- }

with descr as (
  select
    id,
    id_parent,
    text
  from
    tq84_hier_relation    rel                          left join
    tq84_hier_description des on rel.id = des.id_rel and
                                 des.lang = 'de'
),
hier (id, id_parent, text, lvl) as (
  select
    id,
    id_parent,
    text,
    0
  from
    descr
  where
    id_parent is null
union all
  select
    descr.id,
    descr.id_parent,
    descr.text,
    hier.lvl+1
  from
    hier                               join
    descr on hier.id = descr.id_parent
)
search depth first by id set xyz
select 
  substr(lpad(' ', 2*lvl) || nvl(text, '?'), 1, 50),
  xyz
from
  hier;

drop table tq84_hier_description purge;
drop table tq84_hier_relation    purge;
