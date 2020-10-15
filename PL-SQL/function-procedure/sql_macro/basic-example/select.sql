select *        from selectData('foo');
--        NUM TXT
-- ---------- --------------------
--         42 twenty-four

select num, txt from selectData('bar');
-- 
--        NUM TXT
-- ---------- --------------------
--         99 ninety-nine

select txt, num from selectData('baz');
-- 
-- TXT                         NUM
-- -------------------- ----------
-- minus two                    -2
