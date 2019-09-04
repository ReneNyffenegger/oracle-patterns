select
   count(*),
   verb
from
   sqlcommand_verb_noun
where
   verb is not null
group by
   verb
order by
   verb
;
