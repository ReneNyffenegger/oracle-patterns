set feedback off

create table recursive_additions (
  parent     number,
  child      number
--constraint uq_tcb unique (child)
);

comment on table recursive_additions is 'The sum of all children with the same parent is equal to this parent';
