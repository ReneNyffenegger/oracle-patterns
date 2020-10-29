create or replace package polymorphic_intro as

    function describe (tab in out dbms_tf.table_t)
               return dbms_tf.describe_t;

 --
 -- Note: There is only a specification for this function, but
 -- no implementation.
 --
    function pass_table_on(tab in table)
                return table
                pipelined row polymorphic
                using polymorphic_intro;

end polymorphic_intro;
/

create or replace package body polymorphic_intro AS

    function describe (tab in out DBMS_TF.table_t)
             return dbms_tf.describe_t as
    begin
        dbms_output.put_line('poly_pkg.describe was called.');
        return null;
    end describe;

end polymorphic_intro;
/

show errors

create table table_ptf (
   num integer,
   txt varchar2(10)
);

create table table_ptf_same_structure (
   num integer,
   txt varchar2(10)
);

create table table_ptf_different_structure (
   txt varchar2(10),
   num  integer
);


insert into table_ptf values (1, 'one'  );
insert into table_ptf values (2, 'two'  );
insert into table_ptf values (3, 'three');

insert into table_ptf_same_structure values (4, 'four');
insert into table_ptf_same_structure values (5, 'five');

insert into table_ptf_different_structure values ('six'  , 6);
insert into table_ptf_different_structure values ('seven', 8);

commit;

select * from polymorphic_intro.pass_table_on(table_ptf);
select * from polymorphic_intro.pass_table_on(table_ptf_same_structure);
select * from polymorphic_intro.pass_table_on(table_ptf_different_structure);
select * from polymorphic_intro.pass_table_on(table_ptf);

drop package polymorphic_intro;

drop table table_ptf                     purge;
drop table table_ptf_same_structure      purge;
drop table table_ptf_different_structure purge;
