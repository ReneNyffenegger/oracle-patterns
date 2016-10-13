select
  count(         *      ),
  count(distinct saddr  ),
  count(distinct sid    ),
  count(distinct serial#),
  count(distinct paddr  ),
  count(         taddr  ),
  count(distinct taddr  )
from
  v$session;
