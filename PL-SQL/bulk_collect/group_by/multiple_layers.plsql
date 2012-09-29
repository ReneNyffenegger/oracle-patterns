-- Tables {

create table tq84_a (
       id    number primary key,
       txt   varchar2(10)
);

create table tq84_b (
       id    number primary key,
       id_a  references tq84_a,
       txt   varchar2(10)
);

create table tq84_c (
       id    number primary key,
       id_b  references tq84_b,
       txt   varchar2(10)
);

-- }

-- Inserts {

insert into tq84_a values (   1, 'one');

       insert into tq84_b values (  11,  1, 'A');

              insert into tq84_c values (111, 11, '(');
              insert into tq84_c values (112, 11, ')');

       insert into tq84_b values (  12,  1, 'B');

              insert into tq84_c values (121, 12, '!');
              insert into tq84_c values (122, 12, '?');
              insert into tq84_c values (123, 12, '.');
              insert into tq84_c values (124, 12, ',');

       insert into tq84_b values (  13,  1, 'C');

insert into tq84_a values (   2, 'two');


insert into tq84_a values (   3, 'two');

       insert into tq84_b values (  31,  3, 'Y');
       insert into tq84_b values (  32,  3, 'Z');

-- }

-- Types {

create type tq84_c_o as object (
       id   number,
       txt  varchar2(10)
);
/

create type tq84_c_t as table of tq84_c_o;
/

create type tq84_b_o as object (
       id   number,
       txt  varchar2(10),
       c    tq84_c_t
);
/

create type tq84_b_t as table of tq84_b_o;
/

create type tq84_a_o as object (
       id   number,
       txt  varchar2(10),
       b    tq84_b_t
);
/

create type tq84_a_t as table of tq84_a_o;
/

-- }

declare

  complete_tree tq84_a_t;

begin

  select tq84_a_o (
    a.id,
    a.txt,
    -----
      cast ( collect (tq84_b_o ( b.id, b.txt, null ) ) as tq84_b_t )
  ) bulk collect into complete_tree
  from 
        tq84_a a                   join
        tq84_b b on a.id = b.id_a
  group by 
        a.id,
        a.txt;

  dbms_output.new_line;
  for a in 1 .. complete_tree.count loop

      dbms_output.put_line('Id: ' || complete_tree(a).id || ', txt: ' || complete_tree(a).txt);

      for b in 1 .. complete_tree(a).b.count loop

          dbms_output.put_line('   Id: ' || complete_tree(a).b(b).id || ', txt: ' || complete_tree(a).b(b).txt);

          -- ? if complete_tree(a).b(b).c is not null then
          -- ?    for c in 1 .. complete_tree(a).b(b).c.count loop
          -- ?
          -- ?        dbms_output.put_line('      Id: ' || complete_tree(a).b(b).c(c).id || ', txt: ' || complete_tree(a).b(b).c(c).txt);
          -- ?
          -- ?    end loop;
          -- ?    dbms_output.new_line;
          -- ? end if;

      end loop;
      dbms_output.new_line;

  end loop;


--
--  select tq84_outer (o.i,
--                     o.j,
--                     cast(collect(  tq84_inner(i.n, i.t)  order by i.n) as tq84_inner_t)
--                    )
--    bulk collect into t
--    from tq84_o    o    join
--         tq84_i    i    on o.i = i.i
--   group by o.i, o.j;
--
--   --
--
---- does not work  select tq84_outer__ (o.i, -- {
---- does not work                     o.j,
---- does not work                     cast(collect(  tq84_inner__(i.n, i.t)  order by i.n) as tq84_inner_t__)
---- does not work                    )
---- does not work    bulk collect into t
---- does not work    from tq84_o    o    join
---- does not work         tq84_i    i    on o.i = i.i
---- does not work   group by o.i, o.j; -- }
--
--   --
--
--   dbms_output.put_line('Cnt: ' || t.count);
--
--   dbms_output.put_line('Cnt (2): ' || t(2).inner_.count);
--
--   dbms_output.put_line(t(3).inner_(2).t);
--
--   ----------------------------------------------------
--
--   for r in ( 
--       select i, j from table(t)
--   ) loop -- {
--
--     dbms_output.put_line('i: ' || r.i || ', j: ' || r.j);
--
--   end loop; -- }
--
--   ----------------------------------------------------
--
--   dbms_output.new_line;
--
--   ----------------------------------------------------
--
--   for r in ( 
--       select 
--         outer_.i, 
--         outer_.j,
--         inner_.n,
--         inner_.t
--       from 
--         table(t)             outer_, 
--         table(outer_.inner_) inner_
--   ) loop -- {
--
--     dbms_output.put_line('i: ' || r.i || ', j: ' || r.j || ', n: ' || r.n || ', t: ' || r.t);
--
--   end loop; -- }
--
--   ----------------------------------------------------
--
end;
/

drop type  tq84_a_t force;
drop type  tq84_a_o force;
drop type  tq84_b_t force;
drop type  tq84_b_o force;
drop type  tq84_c_t force;
drop type  tq84_c_o force;

drop table tq84_c purge;
drop table tq84_b purge;
drop table tq84_a purge;
