create function tq84_func(nm number) return integer  is
begin
    if nm = 42 then return 1; end if;
    return 0;
end tq84_func;
/


create function tq84_func_deterministic(nm number) return integer deterministic is
begin
    if nm = 42 then return 1; end if;
    return 0;
end tq84_func_deterministic;
/


create function tq84_func_result_cache(nm number) return integer result_cache is
begin
    if nm = 42 then return 1; end if;
    return 0;
end tq84_func_result_cache;
/

