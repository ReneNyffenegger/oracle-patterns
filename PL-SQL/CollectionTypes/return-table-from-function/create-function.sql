create or replace function return_table return t_table as
  v_ret   t_table;
begin

 --
 -- Call constructor to create the returned
 -- variable:
 --
    v_ret  := t_table();

 --
 -- Add one record after another to the returned table.
 -- Note: the »table« must be extended before adding
 -- another record:
 --
    v_ret.extend; v_ret(v_ret.count) := t_record(1, 'one'  );
    v_ret.extend; v_ret(v_ret.count) := t_record(2, 'two'  );
    v_ret.extend; v_ret(v_ret.count) := t_record(3, 'three');

 --
 -- Return the record:
 --
    return v_ret;

end return_table;
/
