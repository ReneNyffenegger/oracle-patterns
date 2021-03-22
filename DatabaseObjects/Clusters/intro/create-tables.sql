create table tq84_cluster_parent (
   id    integer      primary key,
   dt    date
)
cluster tq84_cluster(id);

create table tq84_cluster_child (
   id    integer      references tq84_cluster_parent,
   tx    varchar2(20)
)
cluster tq84_cluster(id);

