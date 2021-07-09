create table tq84_A (
   id number primary key
);

create table tq84_B (
   id   number primary key,
   id_a        references TQ84_A
);

alter table tq84_A add id_b references tq84_B;

drop table tq84_A;
-- ORA-02449: unique/primary keys in table referenced by foreign keys

--
-- Brute force!
-- Remove all foreign key constriaints that
-- refer to table tq84_A.
--
declare
   table_name varchar2(30) := 'TQ84_A';
begin
   for r in (
       select
          fk.constraint_name  fk_cons_name,
          fk.table_name       fk_tab_name
       from
          user_constraints pk   join
          user_constraints fk on pk.constraint_name = fk.r_constraint_name
       where
          pk.table_name      = 'TQ84_A' and
          pk.constraint_type = 'P'
   ) loop

   -- dbms_output.put_line(r.fk_cons_name || ': ' || r.fk_tab_name);
      execute immediate 'alter table ' || r.fk_tab_name || ' drop constraint ' || r.fk_cons_name;

   end loop;
end;
/

drop table tq84_A;
drop table tq84_B;
