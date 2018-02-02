create or replace function return_objects (
    p_max_num_rows in number
)
return t_table as
    v_ret   t_table;
begin

    select 
      t_record(rownum, object_name)
    bulk collect into
      v_ret
    from 
      user_objects
    where
      rownum <= p_max_num_rows;
  
    return v_ret;
  
end return_objects;
/
