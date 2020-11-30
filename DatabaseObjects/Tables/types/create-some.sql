begin
   for r in (select table_name from user_tables where substr(table_name, 1,9) = 'TBL_TYPE_') loop
       execute immediate 'drop table ' || r.table_name || ' purge';
   end loop;
end;
/


create                   table tbl_type_heap               (c number            ) organization heap;
create                   table tbl_type_iot                (c number primary key) organization index;
create global  temporary table tbl_type_glob_temp_com_pres (c number            ) on commit preserve rows;
create global  temporary table tbl_type_glob_temp_com_del  (c number            ) on commit delete   rows;
create private temporary table ORA$PTT_priv_temp_com_pres  (c number            ) on commit preserve definition;
create private temporary table ORA$PTT_priv_temp_com_drop  (c number            ) on commit drop     definition;
