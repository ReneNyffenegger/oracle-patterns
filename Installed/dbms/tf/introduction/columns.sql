create or replace package polymorphic_intro as


    function describe (
                  tab  in out dbms_tf.table_t,
                  cols in out dbms_tf.columns_t
               )
               return dbms_tf.describe_t;

    function pass_table_on(
               tab   in table,
               cols  in columns
             )
             return table
                pipelined row polymorphic
                using polymorphic_intro;


end polymorphic_intro;
/

create or replace package body polymorphic_intro AS

    function describe (
                  tab  in out dbms_tf.table_t,
                  cols in out dbms_tf.columns_t
               )
               return dbms_tf.describe_t as

    begin

        dbms_output.put_line('describe is being called, number of columns: ' || cols.count);
        for colNo in 1 .. cols.count loop
            dbms_output.put_line('  ' || cols(colNo));
        end loop;

        return null;
    end describe;

end polymorphic_intro;
/

sho err

create table table_ptf1 (
   num integer,
   txt varchar2(10)
);

insert into table_ptf1 values (1, 'one'  );
insert into table_ptf1 values (2, 'two'  );
insert into table_ptf1 values (3, 'three');


commit;

select * from polymorphic_intro.pass_table_on(table_ptf1, columns(a      ));
select * from polymorphic_intro.pass_table_on(table_ptf1, columns(bc, def));
select * from polymorphic_intro.pass_table_on(table_ptf1, columns(a      ));
select * from polymorphic_intro.pass_table_on(table_ptf1, columns("foo"  ));
select * from polymorphic_intro.pass_table_on(table_ptf1, columns("bar"  ));
select * from polymorphic_intro.pass_table_on(table_ptf1, columns(a_very_very_very_very_very_very_very_very_very_very_long_column_name));

drop package polymorphic_intro;

drop table table_ptf1                     purge;
