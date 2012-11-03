create table tq84_table_parent (
   id  number primary key,
   tx  varchar2(10)
);

create table tq84_table_child  (
   id_parent references tq84_table_parent,
   tx  varchar2(10)
);

select count(*) || ' constraints found' from user_constraints where table_name = 'TQ84_TABLE_CHILD';

drop table tq84_table_parent cascade constraints purge;

desc tq84_table_child;

select count(*) || ' constraints found' from user_constraints where table_name = 'TQ84_TABLE_CHILD';


drop table tq84_table_child purge;
