connect usr_1/pw_1

create table tab_1 (
   col_1   number,
   col_2   varchar2(10),
   col_3   varchar2(10),
   col_4   varchar2(10)
);

insert into tab_1 values (1, 'one', 'foo', 'important');
insert into tab_1 values (2, 'two', 'bar', 'data!'    );

grant select,
      update(       col_2, col_3)
   on tab_1
   to usr_2;
