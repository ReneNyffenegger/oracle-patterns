begin
   dbms_redefinition.abort_redef_table (
      uname                 => user,
      orig_table            =>'tq84_redefinition',
      int_table             =>'tq84_redefinition_int',
      part_name             => null
   );

end;
/
