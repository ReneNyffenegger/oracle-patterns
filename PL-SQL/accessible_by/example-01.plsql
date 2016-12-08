create or replace package tq84_base_functionality
  ---------------------------
  ACCESSIBLE BY (tq84_pkg_ok)
  ---------------------------
is
  procedure p;
end tq84_base_functionality;
/

create or replace package body tq84_base_functionality as
  
  procedure p is begin
    dbms_output.put_line('tq84_base_functionality.p was called');
  end p;

end tq84_base_functionality;
/

create or replace package tq84_pkg_ok as
  procedure p;
end tq84_pkg_ok;
/

create or replace package tq84_pkg_not_ok as
  procedure p;
end tq84_pkg_not_ok;
/

create or replace package body tq84_pkg_ok as

  procedure p is begin
    tq84_base_functionality.p;
  end p;

end tq84_pkg_ok;
/

create or replace package body tq84_pkg_not_ok as
  procedure p is begin
    null;
--  tq84_base_functionality.p;

--  PLS-00904: insufficient privilege to access object TQ84_BASE_FUNCTIONALITY
  end p;
end tq84_pkg_not_ok;
/

drop package tq84_base_functionality;
drop package tq84_pkg_ok;
drop package tq84_pkg_not_ok;
