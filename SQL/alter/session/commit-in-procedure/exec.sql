--
--    Default:
--
alter session enable commit in procedure;

begin
   tq84_pkg_commit_test.do_something( 1);
   tq84_pkg_commit_test.do_something( 2);
   tq84_pkg_commit_test.do_something( 3);
   tq84_pkg_commit_test.do_something(-1); -- commit
   tq84_pkg_commit_test.do_something( 4);
   tq84_pkg_commit_test.do_something( 5);
   tq84_pkg_commit_test.do_something(-2); -- rollback
end;
/

select * from tq84_tab_commit_test;

alter session disable commit in procedure;


--
-- Following block throws
--    ORA-00034: cannot COMMIT in current PL/SQL session
--
begin
   tq84_pkg_commit_test.do_something( 1);
   tq84_pkg_commit_test.do_something( 2);
   tq84_pkg_commit_test.do_something( 3);
   tq84_pkg_commit_test.do_something(-1); -- commit
end;
/

select * from tq84_tab_commit_test;
