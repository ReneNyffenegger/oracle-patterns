begin

   sys.dbms_advanced_rewrite.declare_rewrite_equivalence (
      name             => 'return_twice_the_num',
      source_stmt      => 'select   num, txt from tq84_rewrite_tab_1',
      destination_stmt => 'select 2*num, txt from tq84_rewrite_tab_1',
      validate         =>  false,
      rewrite_mode     => 'general'
   );

end;
/
