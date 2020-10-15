drop table tab purge;

create table tab (
   col_txt  varchar2(10),
   col_num  number (5,2),
   col_dat  date
);


create or replace package pkg as

    function describe(tab in out dbms_tf.table_t) return dbms_tf.describe_t;

    -- Note, no implementation required for 'func' in package body:
    --
    function func(p_t table) return table pipelined row polymorphic using pkg;

end pkg;
/

create or replace package body pkg as

    function describe(tab in out dbms_tf.table_t) return dbms_tf.describe_t is
    begin

        dbms_output.put_line('schema_name:  ' || tab.schema_name );
        dbms_output.put_line('package_name: ' || tab.package_name);
        dbms_output.put_line('ptf_name:     ' || tab.ptf_name    );

        for i in 1 .. tab.column.count loop
            dbms_output.put_line('  ' || tab.column(i).description.name);
        end loop;

        return null;
    end describe;

end pkg;
/

select * from pkg.func(tab);
