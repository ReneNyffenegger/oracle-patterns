create table tq84_merge_source (
   id         number,
   val        varchar2(10)
);

create table tq84_merge_destination (
   id         number,
   val_1      varchar2(10),
   val_2      varchar2(10)
);

insert into tq84_merge_source      values ( 1, 'one'   );
insert into tq84_merge_source      values ( 2, 'two'   );
insert into tq84_merge_source      values ( 3, 'three' );
insert into tq84_merge_source      values ( 4, 'four'  );
insert into tq84_merge_source      values ( 5, 'five'  );
insert into tq84_merge_source      values ( 6, 'six'   );
insert into tq84_merge_source      values ( 7, 'seven' );
insert into tq84_merge_source      values ( 8, 'eight' );
insert into tq84_merge_source      values ( 9, 'nine'  );
insert into tq84_merge_source      values (10, 'ten'   );
insert into tq84_merge_source      values (20, 'twenty');

insert into tq84_merge_destination values ( 1, '***'   , 'abc');
insert into tq84_merge_destination values ( 6, 'six'   , 'def');
insert into tq84_merge_destination values ( 8, '!!!'   , 'ghi');
insert into tq84_merge_destination values (14, 'XIV'   , 'jlm');


merge into tq84_merge_destination       dst
      using (
         select *
         from
            tq84_merge_source
         )                              src
      on (
            dst.id = src.id
         )
      when matched then
           update set dst.val_1 = src.val

      when not matched then
           insert (dst.id, dst.val_1) values
                  (src.id, src.val  );


select * from tq84_merge_destination order by id;

drop table tq84_merge_source;
drop table tq84_merge_destination;
