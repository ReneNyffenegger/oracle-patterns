--
--  Create multiple tables and views as well as the correpsonding grants in
--  a single transaction.
--
--  CREATE SCHEMA does not create a new schema in the
--  Oracle databse!
--
--  Apparently, there is no DROP SCHEMA statement in Oracle.
--

drop view  tq84_schema_view;
drop table tq84_schema_child;
drop table tq84_schema_parent;

create schema authorization tq84
  create table tq84_schema_parent (
    id         number        primary key,
    col_1      varchar2(10)  not null,
    col_2      varchar2(10)
  )
  create table tq84_schema_child (
    id         number        primary key,
    id_parent  number        references    tq84_schema_parent,
    col_a      varchar2(10)  not null,
    col_b      varchar2(10)
  )
  create view tq84_schema_view as
    select
       p.col_1,
       p.col_2,
       c.col_a,
       c.col_b
    from
      tq84_schema_parent p left join
      tq84_schema_child  c on p.id = c.id_parent
 ;
