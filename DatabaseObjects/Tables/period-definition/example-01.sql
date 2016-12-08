create table tq84_period (
  id        number primary  key,
  txt       varchar2(30),
  --
  valid_b   timestamp invisible,
  valid_e   timestamp invisible,
  --
  period for valid_ (valid_b, valid_e) 
)
;

insert into tq84_period(id, txt, valid_b, valid_e) values (1, 'not valid anymore'  , sysdate - 10, sysdate - 5);
insert into tq84_period(id, txt, valid_b, valid_e) values (2, 'valid'              , sysdate -  3, sysdate + 3);
insert into tq84_period(id, txt, valid_b, valid_e) values (3, 'valid in the future', sysdate +  2, sysdate + 6);

select * from tq84_period as of period for valid_ systimestamp;
-- 
--         ID TXT
-- ---------- ------------------------------
--          2 valid

select * from tq84_period as of period for valid_ systimestamp - 6;
-- 
--         ID TXT
-- ---------- ------------------------------
--          1 not valid anymore

select * from tq84_period as of period for valid_ systimestamp + 4;
-- 
--         ID TXT
-- ---------- ------------------------------
--          3 valid in the future


drop table tq84_period purge;
