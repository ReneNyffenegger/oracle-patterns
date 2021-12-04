insert into tq84_redefinition values (1, '42'    , systimestamp + 59/23);
insert into tq84_redefinition values (2, '-9.876', systimestamp + 51/31);
insert into tq84_redefinition values (3, '1.2e3' , systimestamp + 61/17);

commit;

select * from tq84_redefinition;
