select
  lpad(' ', level-1) || node_from || '->' || node_to
from
  directed_graph
start with
  node_from = 'F'
connect by
  prior node_to = node_from;
