create table tq84_t (
   id     number,
   col_1  varchar2(20),
   col_2  date,
   --
   constraint tq84_t_cpk primary key (id)
);


create unique index tq84_t_ix1 on tq84_t(col_1);
create        index tq84_t_ix2 on tq84_t(col_2);


create table tq84_def (id number primary key, def clob);
create sequence tq84_seq;


declare
  def varchar2(32000);
begin

  def := dbms_metadata.get_ddl('TABLE', 'TQ84_T');

  insert into tq84_def values (tq84_seq.nextval, def);

  for ix in (select index_name from user_indexes where table_name = 'TQ84_T') loop

      def := dbms_metadata.get_ddl('INDEX', ix.index_name);
      insert into tq84_def values (tq84_seq.nextval, def);

  end loop;

end;
/

select def from tq84_def order by id;

drop sequence tq84_seq;
drop table    tq84_def purge;
drop table    tq84_t   purge;
