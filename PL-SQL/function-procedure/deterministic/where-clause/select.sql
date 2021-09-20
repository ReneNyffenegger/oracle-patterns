set timing on

select * from tq84_tab where id = tq84_pkg.f_non_deterministic(1);
select * from tq84_tab where id = tq84_pkg.f_deterministic(1);
