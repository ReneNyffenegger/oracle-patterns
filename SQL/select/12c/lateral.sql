create table tq84_a (
  id   number          primary key,
  txt  varchar2(10) 
);

create table tq84_b (
  id_a number          references tq84_a,
  txt  varchar2(10) 
);

insert into tq84_a values (0, 'zero' );
insert into tq84_a values (1, 'one'  );
insert into tq84_a values (2, 'two'  );
insert into tq84_a values (3, 'three');

insert into tq84_b values (1, '.'    );

insert into tq84_b values (2, '-'    );
insert into tq84_b values (2, '--'   );

insert into tq84_b values (3, '*'    );
insert into tq84_b values (3, '**'   );
insert into tq84_b values (3, '***'  );


insert into tq84_b values (null,'<>');

select
  a.id,
  a.txt   txt_a,
  b.txt   txt_b
from
  tq84_a a,
  lateral(select id, b.txt
            from tq84_b b
           where b.id_a = a.id) b;


drop table tq84_b;
drop table tq84_a;
