create table tq84_failed_insert(
  i number primary key,
  j varchar2(20)
);

create sequence tq84_failed_insert_seq start with 1 increment by 1;

insert into tq84_failed_insert values (5, lpad('-', 5, '-'));
insert into tq84_failed_insert values (9, lpad('-', 9, '-'));


begin

  for i in 1 .. 10 loop

    begin

      insert into tq84_failed_insert values(
        tq84_failed_insert_seq.nextval,
        lpad('-', i, '-')
      );

    exception when dup_val_on_index then
      null;
    end;

  end loop;

end;
/


select * from tq84_failed_insert order by i;

drop table    tq84_failed_insert purge;
drop sequence tq84_failed_insert_seq;
