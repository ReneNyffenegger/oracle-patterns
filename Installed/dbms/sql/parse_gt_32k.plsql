--
--  http://stackoverflow.com/a/20554246/180275
--

create table tq84_gt32_k_dest (
  col_1   number,
  col_2   varchar2(10),
  col_3   date
);

create table tq84_gt32_k_src (
  col_1   number,
  col_2   varchar2(10),
  col_3   date
);

insert into tq84_gt32_k_src values (1, 'one'  , sysdate  );
insert into tq84_gt32_k_src values (2, 'two'  , sysdate+1);
insert into tq84_gt32_k_src values (3, 'three', sysdate-1);


declare
    stmt dbms_sql.varchar2a;
    c number;
    res number;
begin
    stmt( 1) := 'insert into tq84_gt32_k_dest (';
    stmt( 2) := '  col_1,';
    stmt( 3) := '  col_2,';
    stmt( 4) := '  col_3)';
    stmt( 5) := 'select ';
    stmt( 6) := '  col_1,';
    stmt( 7) := '  col_2,';
    stmt( 8) := '  col_3 ';
    stmt( 9) := 'from tq84_gt32_k_src ';
    stmt(10) := 'where';
    stmt(11) := '  col_1 != 1';


 -- each element can have up to 32K characters, number of elements is (almost) unlimited

    c := dbms_sql.open_cursor;
    dbms_sql.parse(c, stmt, 1, 11, true, dbms_sql.native);
    res := dbms_sql.execute(c);
    dbms_sql.close_cursor(c);

end;
/

select * from tq84_gt32_k_dest;

drop table tq84_gt32_k_dest;
drop table tq84_gt32_k_src;
