create table tq84_clob_compare (
  i  number primary key,
  c  clob
);

insert into tq84_clob_compare values ( 1, empty_clob());
insert into tq84_clob_compare values ( 2, empty_clob());
insert into tq84_clob_compare values ( 3, empty_clob());
insert into tq84_clob_compare values ( 4, empty_clob());
insert into tq84_clob_compare values (20, empty_clob());

insert into tq84_clob_compare values (99, empty_clob());
insert into tq84_clob_compare values (99, empty_clob());

declare
  c_ clob;
begin

  for j in 1 .. 4 loop

      select c into c_ from tq84_clob_compare where i = j;    

         if j = 1 then dbms_lob.append(c_, 'one'  ); 
      elsif j = 2 then dbms_lob.append(c_, 'two'  );
      elsif j = 3 then dbms_lob.append(c_, 'three');
      elsif j = 4 then dbms_lob.append(c_, 'four' ); end if;

  end loop;

  select c into c_ from tq84_clob_compare where i = 20;

  dbms_lob.append(c_, 'two');
end;
/

commit;

-- first one smaller than second one returns -1.
-- first one greater than second one returns  1.
-- first one equal to second one returns 0.
select t.i, u.i, dbms_lob.compare(t.c, u.c) 
  from tq84_clob_compare t,
       tq84_clob_compare u;


drop table tq84_clob_compare;
