with function tq84_func_local(nm number) return integer is
begin
    if nm = 42 then return 1; end if;
    return 0;
end tq84_func_local;
select count(*) from tq84_tab where tq84_func_local(nm) = 1;
/
