select
   verb
from
   sqlcommand_verb_noun
where
   noun is null
order by
   verb;
