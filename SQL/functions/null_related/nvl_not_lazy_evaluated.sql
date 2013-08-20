--
--     Demonstrating that NVL is not evaluating lazily.
--

create table tq84_a (
  a number          primary key,
  b varchar2(10)
);

create table tq84_b (
  c number          primary key,
  d number
);

create function tq84_f(a in number) return varchar2
is
begin
 
    dbms_output.put_line('function was called: ' || a);

    return '* ' || a || ' *';

end tq84_f;
/


insert into tq84_a values (1, 'one'  );
insert into tq84_a values (2,  null  );
insert into tq84_a values (3,  null  );
insert into tq84_a values (4, 'four' );

insert into tq84_b values (2,  20);
insert into tq84_b values (4,  40);

select
  substr(tq84_f(a), 1, 10) a,
  b,
  substr(nvl (
    b,
   (select tq84_f(d) from tq84_b where c = a)
  )
  ,1,10) c
from
  tq84_a
order by a;
  

drop table tq84_a purge;
drop table tq84_b purge;

drop function tq84_f;
