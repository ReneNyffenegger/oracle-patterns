create index tq84_part_local_ix on tq84_part_ix_test (val_2)
   local (
      partition        p_lt_10000 (
         subpartition  sp_foo,
         subpartition  sp_bar,
         subpartition  sp_baz
      )
   );
