drop   table tq84_virt_of_virt;

--
-- Virtual columns cannot be referenced in
-- other virtual columns:
--
create table tq84_virt_of_virt (
   num number,
   num_squared as (num * num),
-- num_cubed   as (num * num_squared) -- ORA-54012: virtual column is referenced in a column expression
   num_cubed   as (num * num * num)
);

insert into tq84_virt_of_virt (num) values (1);
insert into tq84_virt_of_virt (num) values (2);
insert into tq84_virt_of_virt (num) values (3);

select * from tq84_virt_of_virt;
