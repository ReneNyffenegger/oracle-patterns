create table tq84_part_list_hash (
  col_dt   date,
  col_vc   varchar2(10),
  dat      varchar2(10)
)
   partition by list (col_vc)
subpartition by hash (col_dt) subpartitions 4 (
  partition p_foo  values('foo'  ),
  partition p_bar  values('bar'  ),
  partition p_baz  values('baz'  ),
  partition p_null values( null  ),
  partition p_def  values(default)
);

insert into tq84_part_list_hash values (sysdate  , 'foo', 'one'  );
insert into tq84_part_list_hash values (sysdate+1, 'bar', 'two'  );
insert into tq84_part_list_hash values (sysdate  , 'baz', 'three');

select * from tq84_part_list_hash partition (p_foo);

drop table tq84_part_list_hash purge;
