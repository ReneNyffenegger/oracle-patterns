select 
  lpad(' ', level-1) || node_from || '->' || node_to
from
  directed_graph
start with
  node_from = 'A'
connect by nocycle
  prior node_to = node_from;
