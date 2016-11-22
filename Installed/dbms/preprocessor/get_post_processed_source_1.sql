alter session set plsql_ccflags='';

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


create or replace procedure tq84_pkg_print_source as -- {
  source_lines dbms_preprocessor.source_lines_t;
begin

  dbms_output.new_line;

  source_lines := dbms_preprocessor.get_post_processed_source (
    object_type => 'PACKAGE BODY',
    schema_name =>  user,
    object_name => 'TQ84_PKG'
  );

  for i in 1 .. source_lines.count loop
      dbms_output.put_line(to_char(i, '99') || ': ' || replace(source_lines(i), chr(10), ''));
  end loop;

end tq84_pkg_print_source; -- }
/

exec tq84_pkg_print_source;

alter session set plsql_ccflags='tq84_flg:true';
alter package tq84_pkg compile;

exec tq84_pkg_print_source;

drop package   tq84_pkg;
drop procedure tq84_pkg_print_source;
