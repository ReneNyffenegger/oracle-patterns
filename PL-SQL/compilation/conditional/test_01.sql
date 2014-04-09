alter session set plsql_ccflags='NEW_FEATURE:true';


create package tq84_package as
  procedure do;
  procedure line;
  procedure unit;
  procedure compilation_parameters;
end tq84_package;
/


create package body tq84_package as

    procedure do is
    begin

      dbms_output.put_line(

$IF $$NEW_FEATURE $THEN
         'Congratulation, you have the new feature (line: '
$ELSE
         'We recommend you upgrade to the new feature'
$END
      );

    end do;


    procedure line is begin
      dbms_output.put_line('Line is: ' || $$PLSQL_LINE);
    end line;


    procedure unit is begin
      dbms_output.put_line('Unit is: ' || $$PLSQL_UNIT);
    end unit;


    procedure compilation_parameters is begin
      dbms_output.put_line( 'PLSCOPE_SETTINGS:      ' || $$PLSCOPE_SETTINGS      );
      dbms_output.put_line( 'PLSQL_CCFLAGS:         ' || $$PLSQL_CCFLAGS         );
      dbms_output.put_line( 'PLSQL_CODE_TYPE:       ' || $$PLSQL_CODE_TYPE       );
      dbms_output.put_line( 'PLSQL_OPTIMIZE_LEVEL:  ' || $$PLSQL_OPTIMIZE_LEVEL  );
      dbms_output.put_line( 'PLSQL_WARNINGS:        ' || $$PLSQL_WARNINGS        );
      dbms_output.put_line( 'NLS_LENGTH_SEMANTICS:  ' || $$NLS_LENGTH_SEMANTICS  );
      dbms_output.put_line( 'PERMIT_92_WRAP_FORMAT: ' || $$PERMIT_92_WRAP_FORMAT );
    end compilation_parameters;


end tq84_package;
/


begin

     dbms_preprocessor.print_post_processed_source(

        object_type   => 'PACKAGE BODY',
        schema_name   =>  user,
        object_name   => 'TQ84_PACKAGE'

     );

end;
/


exec tq84_package.do;
exec tq84_package.line;
exec tq84_package.unit;
exec tq84_package.compilation_parameters;


connect c##user_01/pw

exec tq84_package.do;

alter session set plsql_ccflags='NEW_FEATURE:false';

exec tq84_package.do;

alter package tq84_package compile;

drop package tq84_package;
