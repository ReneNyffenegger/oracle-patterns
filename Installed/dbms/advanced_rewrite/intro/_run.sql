@ grant

connect rene/rene
@ table-1
@ equivalence-1
@ select-1

begin
   sys.dbms_advanced_rewrite.drop_rewrite_equivalence('return_twice_the_num');
end;
/

drop table tq84_rewrite_tab_1;
