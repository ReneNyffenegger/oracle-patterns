create type tq84_inner as object (
  n number,
  t varchar2(10)
);
/

create type tq84_inner_t as table of tq84_inner;
/

create type tq84_outer as object (
  i       number,
  j       varchar2(10),
  inner_  tq84_inner_t
);
/

create type tq84_outer_t as table of tq84_outer;
/

create table tq84_o (
  i  number primary key,
  j  varchar2(10)
);

create table tq84_i (
  i   references tq84_o,
  n   number,
  t   varchar2(10)
);

-- Inserts {
insert into tq84_o values (1, 'one');
insert into tq84_o values (2, 'two');
insert into tq84_o values (3, 'three');
insert into tq84_o values (4, 'four');

insert into tq84_i values (1, 1, 'apple');
insert into tq84_i values (1, 2, 'pear');
insert into tq84_i values (1, 3, 'lemon');
insert into tq84_i values (1, 4, 'grape');

insert into tq84_i values (2, 1, 'car');
insert into tq84_i values (2, 2, 'bike');

insert into tq84_i values (3, 1, 'foo');
insert into tq84_i values (3, 2, 'bar');
insert into tq84_i values (3, 3, 'baz');
-- }

declare

  t tq84_outer_t;

-- does not work  type tq84_inner__ is record ( -- {
-- does not work    n number,
-- does not work    t varchar2(10)
-- does not work  );
-- does not work
-- does not work  type tq84_inner_t__ is table of tq84_inner__;
-- does not work
-- does not work  type tq84_outer__ is record (
-- does not work    i       number,
-- does not work    j       varchar2(10),
-- does not work    inner_  tq84_inner_t
-- does not work  );
-- does not work  
-- does not work  type tq84_outer_t__ is table of tq84_outer__;
-- does not work
-- does not work  t__ tq84_outer_t__; -- }

begin

  select tq84_outer (o.i,
                     o.j,
                     cast(collect(  tq84_inner(i.n, i.t)  order by i.n) as tq84_inner_t)
                    )
    bulk collect into t
    from tq84_o    o    join
         tq84_i    i    on o.i = i.i
   group by o.i, o.j;

   --

-- does not work  select tq84_outer__ (o.i, -- {
-- does not work                     o.j,
-- does not work                     cast(collect(  tq84_inner__(i.n, i.t)  order by i.n) as tq84_inner_t__)
-- does not work                    )
-- does not work    bulk collect into t
-- does not work    from tq84_o    o    join
-- does not work         tq84_i    i    on o.i = i.i
-- does not work   group by o.i, o.j; -- }

   --

   dbms_output.put_line('Cnt: ' || t.count);

   dbms_output.put_line('Cnt (2): ' || t(2).inner_.count);

   dbms_output.put_line(t(3).inner_(2).t);

   ----------------------------------------------------

   for r in ( 
       select i, j from table(t)
   ) loop -- {

     dbms_output.put_line('i: ' || r.i || ', j: ' || r.j);

   end loop; -- }

   ----------------------------------------------------

   dbms_output.new_line;

   ----------------------------------------------------

   for r in ( 
       select 
         outer_.i, 
         outer_.j,
         inner_.n,
         inner_.t
       from 
         table(t)             outer_, 
         table(outer_.inner_) inner_
   ) loop -- {

     dbms_output.put_line('i: ' || r.i || ', j: ' || r.j || ', n: ' || r.n || ', t: ' || r.t);

   end loop; -- }

   ----------------------------------------------------

end;
/


drop table tq84_i purge;
drop table tq84_o purge;

drop type tq84_outer_t;
drop type tq84_outer;
drop type tq84_inner_t;
drop type tq84_inner force;
