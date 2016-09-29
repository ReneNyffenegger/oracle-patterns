create table tq84_ora_12838 (
  col_1 number,
  col_2 varchar2(30)
);


insert /*+ append */ into tq84_ora_12838 select rownum, object_name from all_objects where rownum < 10;

--
-- commit the transaction and the ORA-12838 disappears.
-- 
-- commit;
--

-- Without commit: ORA-12838
select * from tq84_ora_12838;

drop table tq84_ora_12838 purge;
