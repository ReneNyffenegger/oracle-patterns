create table tabOne (id integer primary key, num number, txt varchar2(20));
create table tabTwo (id integer primary key, num number, txt varchar2(20));


begin
   dbms_comparison.create_comparison(
      comparison_name    => 'tabOne_vs_tabTwo',
      schema_name        =>  user             ,
      object_name        => 'tabOne'          ,
      dblink_name        =>  null             ,
      remote_schema_name =>  user             ,
      remote_object_name => 'tabTwo'
--    column_list        => 'num,txt'
   );
end;
/

insert into tabOne values(1,    8, 'eight');
insert into tabOne values(2,    4, 'four' );
insert into tabOne values(3,    7, 'seven');
insert into tabOne values(4, null, 'null' );
insert into tabOne values(5,    0,  null  );
insert into tabOne values(6,    9, 'nine' );
insert into tabOne values(7,    3, 'three');



--
-- Most records are unchaged in tabTwo ...
--
insert into tabTwo select * from tabOne;


--
-- ... but there ARE some changes:
--
delete from tabOne where id = 2;
insert into tabOne values (9,    2, 'two');

update tabOne set txt = 'NINE' where num = 9;

insert into tabTwo values (8,    3, 'three');


commit;



declare
   comp_info dbms_comparison.comparison_type;
   equal     boolean;
begin
   equal := dbms_comparison.compare(
      comparison_name    => 'tabOne_vs_tabTwo',
      scan_info          =>  comp_info        ,   /* out parameter */
      perform_row_dif    =>  true
   );

   if equal then
      dbms_output.put_line('data is equal');
   else
      dbms_output.put_line('data is different');
      dbms_output.put_line('  scan id:             ' || comp_info.scan_id);
   --
   --    Following values only filled with converge
   --
   -- dbms_output.put_line('  local rows merged:   ' || comp_info.loc_rows_merged );
   -- dbms_output.put_line('  remote rows merged:  ' || comp_info.rmt_rows_merged );
   -- dbms_output.put_line('  local rows deleted:  ' || comp_info.loc_rows_deleted);
   -- dbms_output.put_line('  remote rows deleted: ' || comp_info.rmt_rows_deleted);
   end if;
end;
/

select
   dif.scan_id,
   loc.num loc_num,
   rmt.num rmt_num,
   loc.txt loc_txt,
   rmt.txt rmt_txt
from
   dba_comparison_row_dif  dif                                 left join
   tabOne                  loc on dif.local_rowid  = loc.rowid left join
   tabTwo                  rmt on dif.remote_rowid = rmt.rowid
where
   dif.scan_id in (
      select
         scan_id
      from
         dba_comparison_scan_summary
      where
         comparison_name = 'TABONE_VS_TABTWO' and
         status          = 'ROW DIF'
   );
--
--    SCAN_ID    LOC_NUM    RMT_NUM LOC_TXT              RMT_TXT
-- ---------- ---------- ---------- -------------------- --------------------
--         84          9          9 NINE                 nine
--         84          2            two
--         83                     4                      four
--         84                     3                      three

exec dbms_comparison.drop_comparison('tabOne_vs_tabTwo');

drop table tabOne;
drop table tabTwo;
