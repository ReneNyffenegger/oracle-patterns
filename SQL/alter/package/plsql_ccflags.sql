
create or replace package tq84_pkg as -- {

    procedure p;

end tq84_pkg; -- }
/

create or replace package body tq84_pkg as -- {

    procedure p is
    begin

      $if $$tq84_flg $then
          dbms_output.put_line('$$tq84_flg is true');
      $else
          dbms_output.put_line('$$tq84_flg is not true');
      $end

    end p;

end tq84_pkg; -- }
/

exec tq84_pkg.p
-- $$tq84_flg is not true

alter package tq84_pkg compile plsql_ccflags='tq84_flg:true';

exec tq84_pkg.p
-- $$tq84_flg is true

drop package tq84_pkg;
