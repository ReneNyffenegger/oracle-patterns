create table tq84_unpivot (
  id            number primary key,
  val_english   varchar2(10),
  val_german    varchar2(10),
  val_french    varchar2(10)
);

insert into tq84_unpivot values (1, 'one'  , 'eins', 'un'     );
insert into tq84_unpivot values (2, 'two'  , 'zwei', 'deux'   );
insert into tq84_unpivot values (3, 'three', 'drei', 'trois'  );
insert into tq84_unpivot values (4, 'four' , 'vier', 'quattre');

select *
  from tq84_unpivot
  unpivot (
    val for language in (
      val_english as 'English',
      val_german  as 'German' ,
      val_french  as 'French')
  )
order by
  id,
  language;
--         ID LANGUAG VAL
-- ---------- ------- ----------
--          1 English one
--          1 French  un
--          1 German  eins
--          2 English two
--          2 French  deux
--          2 German  zwei
--          3 English three
--          3 French  trois
--          3 German  drei
--          4 English four
--          4 French  quattre
--          4 German  vier

drop table tq84_unpivot purge;
