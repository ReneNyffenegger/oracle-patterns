drop   type type_one;
create type type_one as object (
   foo number  (5,2),
   bar varchar2(100 byte),
   baz date
);
/

drop   type type_two;
create type type_two as object (
   a   number(5,2),
   b   char  (5 byte)
);
/

 -- TODO...
-- create type type_two_t as table of type_two;
-- /
