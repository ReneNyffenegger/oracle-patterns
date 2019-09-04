select
   count(*),
   noun
from
   sqlcommand_verb_noun
where
   noun is not null
group by
   noun
order by
   noun
;
