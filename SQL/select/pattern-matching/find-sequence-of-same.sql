create table tq84_t (
  id      number,
  word    varchar2(10)
);

insert into tq84_t values ( 1, 'ab'     );
insert into tq84_t values ( 2, 'ab'     );
insert into tq84_t values ( 3, 'cde'    );
insert into tq84_t values ( 4, 'cde'    );
insert into tq84_t values ( 5, 'cde'    );
insert into tq84_t values ( 6, 'cde'    );
insert into tq84_t values ( 7, 'ab'     );
insert into tq84_t values ( 8, 'cde'    );
insert into tq84_t values ( 9, 'fghij'  );
insert into tq84_t values (10, 'fghij'  );
insert into tq84_t values (11, 'fghij'  );
insert into tq84_t values (12, 'fghij'  );
insert into tq84_t values (13, 'fghij'  );
insert into tq84_t values (14, 'fghij'  );
insert into tq84_t values (15, 'fghij'  );
insert into tq84_t values (16, 'ab'     );
insert into tq84_t values (17, 'ab'     );
insert into tq84_t values (18, 'klmnopq');
insert into tq84_t values (19, 'cde'    );
insert into tq84_t values (20, 'cde'    );

select
  count_same_words  cnt,
  id_start,
  word
from
  tq84_t
match_recognize (
  order by
    id 
  measures
    a_word.word      as word,
    first(a_word.id) as id_start,
--  match_number()   as match_counter,
    count(*)         as count_same_words
  one row per match
  pattern (
    a_word* another_word
  )
  define
    a_word           as a_word.word        = first(a_word.word),
    another_word     as another_word.word != a_word.word
)
order by
  count_same_words desc;

drop table tq84_t purge;
