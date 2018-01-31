create procedure is_ancestor_descendant(ancestor in varchar2, descendant in varchar2) as
  cnt number;
begin
  select
    count(*) into cnt
  from
    parent_child
  where
    child_  = descendant
  start with
    parent_ = ancestor
  connect by 
    prior child_ = parent_;

  if cnt > 0 then
     dbms_output.put_line(ancestor || ' is an ancestor of ' || descendant);
  else
     dbms_output.put_line(ancestor || ' is no ancestor of ' || descendant);
  end if;

end;
/
