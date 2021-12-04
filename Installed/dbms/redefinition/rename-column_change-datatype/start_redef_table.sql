begin
   dbms_redefinition.start_redef_table(
      uname                 =>  user,
      orig_table            => 'tq84_redefinition',
      int_table             => 'tq84_redefinition_int',
      col_mapping           => q'[
         id,
         cast(num as number) num,
         cast(ts as date   ) dt
      ]',
      options_flag          =>  dbms_redefinition.cons_use_pk,
      orderby_cols          =>  null,
      part_name             =>  null,
      continue_after_errors =>  false,
      copy_vpd_opt          =>  dbms_redefinition.cons_vpd_none,
      refresh_dep_mviews    => 'N',
      enable_rollback       =>  false
   );

end;
/
