select
 --count(*),
  program 
from
  v$session
where
  program not like 'oracle@%'
group by
  program
order by
  count(*) desc;
-- The query might find programs such as:
--   tabprotosrv.exe
--   Toad.exe
--   JDBC Thin Client
--   SQL Developer
--   EXCEL.EXE
--   MSACCESS.EXE
--   WIReportServer.exe
--   plsqldev.exe
--   WebIRichClient.exe
--   OMS
--   sqlplus.exe
--   DTExec.exe
--   Rgui.exe
--   APEX Listener
--   brioqry.exe  
