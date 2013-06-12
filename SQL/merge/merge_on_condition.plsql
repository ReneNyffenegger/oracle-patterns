create table tq84_merge_on_conditon (
  id           number primary key,
  updateable   number not null check (updateable in (0,1)),
  text         varchar2(20)
);


insert into tq84_merge_on_conditon values (1, 1, 'abcdefghij'       );
insert into tq84_merge_on_conditon values (2, 1, '1234567890'       );
insert into tq84_merge_on_conditon values (3, 0, 'can not be merged');
insert into tq84_merge_on_conditon values (4, 1, '###'              );

declare
  
  procedure merge_ (p_id in number, p_text in varchar2) is -- {
  begin

      merge into tq84_merge_on_conditon t 

            using (select p_id p_id, p_text p_text from dual) u
            on    (t.id = u.p_id)

      when  matched then update set
            t.text = case when t.updateable = 1 then u.p_text else t.text end

      when  not matched then insert (
            id, updateable, text) values (
            u.p_id, 1, u.p_text);

  end merge_; -- }

begin

  merge_(3, 'should not merge');
  merge_(4, 'should merge'    );
  merge_(5, 'new record'      );

end;
/

select * from tq84_merge_on_conditon order by id;

drop table tq84_merge_on_conditon purge;
