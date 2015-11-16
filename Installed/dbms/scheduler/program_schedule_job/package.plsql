create or replace package tq84_pkg as -- {

  procedure proc;

end tq84_pkg; -- }
/

create or replace package body tq84_pkg as -- {

  procedure proc is -- {
  begin
    insert into tq84_table values (sysdate, 'Inserted from tq84_pkg.proc');
  end proc; -- }

end tq84_pkg; -- }
/
