drop table tab purge; 

create table tab (
   col_one    number,
   col_two    number,
   col_three  number,
   col_four   number,
   col_five   number,
   col_six    number,
   col_seven  number,
   col_eight  number,
   col_nine   number
);

insert into tab values (   1,   2,   3,   4,   5,   6,   7,   8,   9);
insert into tab values (  11,  22,  33,  44,  55,  66,  77,  88,  99);
insert into tab values ( 111, 222, 333, 444, 555, 666, 777, 888, 999);


create or replace package pkg as

    function describe(
               tab           in out dbms_tf.table_t,
               addedColumns in     dbms_tf.columns_t
             ) return dbms_tf.describe_t;

    procedure fetch_rows;

    function func(p_t table, p_c columns) return table pipelined row polymorphic using pkg;

end pkg;
/

create or replace package body pkg as

    function describe(
               tab          in out dbms_tf.table_t,
               addedColumns in     dbms_tf.columns_t
             ) return dbms_tf.describe_t is


        selectedColumns dbms_tf.columns_new_t;
        selectedColNo   pls_integer := 0;

    begin

        for tabColNo in 1 .. tab.column.count loop

--          dbms_output.put_line('tabColNo = ' || tabColNo || ': ' || tab.column(tabColNo).description.name);
            tab.column(tabColNo).for_read := false;

            for addedColNo in 1 .. addedColumns.count loop
--              dbms_output.put_line('  addedColNo = ' || addedColNo || ': ' || addedColumns(addedColNo));

                if tab.column(tabColNo).description.name = addedColumns(addedColNo) then

--                  dbms_output.put_line('    column names are equal');

                    tab.column(tabColNo).for_read := true;

                    selectedColNo := selectedColNo + 1;
                    selectedColumns(selectedColNo) := tab.column(tabColNo).description;
                    selectedColumns(selectedColNo).name := 'tq84_' || selectedColNo;

                -- skip inner iteration
                   exit;
                end if;

            end loop;
        end loop;
        
        return dbms_tf.describe_t(new_columns => selectedColumns);

    end describe;

    procedure fetch_rows is
        rowset dbms_tf.row_set_t;
    begin

        dbms_tf.get_row_set(rowset);
        dbms_tf.put_row_set(rowset);

    end fetch_rows;

end pkg;
/

show errors

select * from pkg.func(tab, columns(col_seven, col_five, col_six));
--
--    COL_ONE    COL_TWO  COL_THREE   COL_FOUR   COL_FIVE    COL_SIX  COL_SEVEN  COL_EIGHT   COL_NINE     TQ84_1     TQ84_2     TQ84_3
-- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
--          1          2          3          4          5          6          7          8          9          5          6          7
--         11         22         33         44         55         66         77         88         99         55         66         77
--        111        222        333        444        555        666        777        888        999        555        666        777