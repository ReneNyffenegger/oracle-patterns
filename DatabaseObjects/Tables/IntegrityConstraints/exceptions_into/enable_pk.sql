create table tq84_exceptions(
   row_id     rowid,
   owner      varchar2(30),
   table_name varchar2(30),
   constraint varchar2(30)
);

create table tq84_table_with_pk (
   id  number,
   txt varchar2(20)
);

alter table tq84_table_with_pk add constraint tq84_table_pk primary key (id) disable;

insert into tq84_table_with_pk values (1, 'one'      );
insert into tq84_table_with_pk values (2, 'two'      );
insert into tq84_table_with_pk values (3, 'three'    );
insert into tq84_table_with_pk values (1, 'one again');

commit;

-----------------------------------------------------

alter table tq84_table_with_pk enable constraint tq84_table_pk exceptions into tq84_exceptions;
--
-- ORA-02437: cannot validate (RENE.TQ84_TABLE_PK) - primary key violated

-- Show offending (two) records
--
select * from tq84_table_with_pk where rowid in (select row_id from tq84_exceptions);

drop table tq84_table_with_pk purge;
drop table tq84_exceptions    purge;
