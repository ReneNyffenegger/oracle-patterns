drop type obj;

create or replace package collection_types_and_records as

    type tab_of_vc2                 is table of varchar2(20);
    type tab_of_vc2_index_by        is table of varchar2(20)            index by pls_integer;

    type tab_of_tab_of_vc2          is table of tab_of_vc2;
    type tab_of_tab_of_vc2_index_by is table of tab_of_vc2_index_by     index by varchar2(10);

 -- 5 is the maximum number of elements.
 -- instances can be created with less than 5 elements
    type varray_5_of_vc2            is varray(5) of varchar2(10);

    type rec is record (
         f_num                 number,
         f_vc2                 varchar2(10),
      --
      -- A record can store
      -- collection types:
      --
         f_tab_of_vc2          tab_of_vc2,
         f_tab_of_vc2_index_by tab_of_vc2_index_by,
         f_varray_5_of_vc2     varray_5_of_vc2
    );

 --
 -- It's possible to create collection types whose elements
 -- are records:
    type tab_of_rec                 is table of rec;
    type tab_of_rec_index_by        is table of rec index by varchar2(10);
    type varray_3_of_rec            is varray(3) of rec;

    procedure run;

end collection_types_and_records;
/

show errors

create or replace package body collection_types_and_records as

    procedure iterate_over(tab tab_of_tab_of_vc2) is
       ix_outer varchar2(10);
       ix_inner pls_integer;

    begin

       ix_outer := tab.first;
       while ix_outer is not null loop

             dbms_output.put_line(ix_outer);
             ix_inner := tab(ix_outer).first;
             while ix_inner is not null loop
                 dbms_output.put_line('  ' || ix_inner || ': ' || tab(ix_outer)(ix_inner));

                 ix_inner := tab(ix_outer).next(ix_inner);
             end loop;

             ix_outer := tab.next(ix_outer);
       end loop;

    end iterate_over;

    procedure iterate_over(tab tab_of_tab_of_vc2_index_by) is
       ix_outer varchar2(10);
       ix_inner pls_integer;

    begin

       ix_outer := tab.first;
       while ix_outer is not null loop

             dbms_output.put_line(ix_outer);
             ix_inner := tab(ix_outer).first;
             while ix_inner is not null loop
                 dbms_output.put_line('  ' || ix_inner || ': ' || tab(ix_outer)(ix_inner));

                 ix_inner := tab(ix_outer).next(ix_inner);
             end loop;

             ix_outer := tab.next(ix_outer);
       end loop;

    end iterate_over;

    procedure iterate_over(tab varray_5_of_vc2) as begin

        dbms_output.put_line('Iterating over varray_5_of_vc2');
        for ix in 1 .. tab.count loop
            dbms_output.put_line('  ' || tab(ix));
        end loop;

    end iterate_over;

    procedure run is
       v_tab_of_vc2                   tab_of_vc2;                 -- Must be initialized
       v_tab_of_tab_of_vc2            tab_of_tab_of_vc2;

       v_tab_of_vc2_index_by          tab_of_vc2_index_by;        -- No initialization necessary
       v_tab_of_tab_of_vc2_index_by   tab_of_tab_of_vc2_index_by;

       v_varray_5_of_vc2              varray_5_of_vc2 := -- Must be initialized
                                      varray_5_of_vc2('I', 'II', 'III', 'IV', 'V');
    begin

       v_tab_of_vc2 := tab_of_vc2();

       v_tab_of_vc2.extend; v_tab_of_vc2(1) := '1/1';
       v_tab_of_vc2.extend; v_tab_of_vc2(2) := '1/2';


       v_tab_of_tab_of_vc2 := tab_of_tab_of_vc2 (
            v_tab_of_vc2,
              tab_of_vc2('2/1', '2/2')
       );


       dbms_output.put_line('v_tab_of_tab_of_vc2 has ' || v_tab_of_tab_of_vc2.count || ' elements');
       iterate_over(v_tab_of_tab_of_vc2);

       -----------------------------------------------------------------

       v_tab_of_vc2_index_by(42) := 'forty-two';
       v_tab_of_vc2_index_by(99) := 'ninty-nine';

       v_tab_of_tab_of_vc2_index_by('numbers') := v_tab_of_vc2_index_by;
       v_tab_of_tab_of_vc2_index_by('fruits' )(1) := 'Apple';
       v_tab_of_tab_of_vc2_index_by('fruits' )(2) := 'Banana';

       dbms_output.put_line('v_tab_of_tab_of_vc2_index_by has ' || v_tab_of_tab_of_vc2_index_by.count || ' elements');
       iterate_over(v_tab_of_tab_of_vc2_index_by);

       -----------------------------------------------------------------

       dbms_output.put_line('v_varray_5_of_vc2 has ' || v_varray_5_of_vc2.count || ' elements');
       iterate_over(v_varray_5_of_vc2);
    --
    -- Create a new instance with less elements:
       v_varray_5_of_vc2 := varray_5_of_vc2('one', 'two', 'three');
       dbms_output.put_line('v_varray_5_of_vc2 has ' || v_varray_5_of_vc2.count || ' elements');
       iterate_over(v_varray_5_of_vc2);



    end run;

end;
/

show errors

exec collection_types_and_records.run

--
-- Schema level collection types can be used in object types
--
create or replace type tab_of_num   is table of number;
/

create or replace type varray_3_of_num      is varray(3) of number;
/

-- create or replace type assoc_array_t  is table of number          index by varchar2(10);
-- PLS-00355: use of pl/sql table not allowed in this contex

-- create type rec is record ( a number );
-- /
-- PLS-00103: Encountered the symbol "RECORD" when expecting one of
--          the following:
--          array varray table object fixed varying opaque sparse


declare
   x  collection_types_and_records.tab_of_vc2;
begin
   x := collection_types_and_records.tab_of_vc2('foo', 'bar', 'baz');
end;
/

create or replace type obj as object (
   num                  number,
--
-- Collection types defined in packages cannot be used in objects:
-- tab_of_vc2           collection_types_and_records.tab_of_vc2        , -- PLS-00201: identifier 'COLLECTION_TYPES_AND_RECORDS.TAB_OF_VC2' must be declared
-- tabl_of_vc2_index_by collection_types_and_records.tab_of_vc2_index_by, --  same
-- --------------
-- Schema level collection types can be used in object types
--
   tab  tab_of_num,
   var  varray_3_of_num
);
/

/*
select * from user_coll_types;
select * from user_plsql_coll_types;
select * from user_plsql_types;
*/
