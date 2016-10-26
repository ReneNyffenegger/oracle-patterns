select
  sesw.sid,
  sesw.seq#,
  sesw.event,
  -----------------------------------------------
  case sesw.p1text 
       when 'file#' then dafi.name
       else  sesw.p1text || ': ' || sesw.p1
       end                                    p1,
  -----------------------------------------------
  case sesw.p2text
       when 'block#' then 'block ' || sesw.p2
       else  sesw.p2text || ': '|| sesw.p2
       end                                    p2,
  -----------------------------------------------
  case sesw.p3text
       when 'blocks' then sesw.p3 || ' blocks'
       else  sesw.p3text || ': '|| sesw.p3
       end                                    p3
  -----------------------------------------------       
from
  v$session_wait  sesw                                    left join
  v$datafile      dafi on sesw.p1 = dafi.file#
