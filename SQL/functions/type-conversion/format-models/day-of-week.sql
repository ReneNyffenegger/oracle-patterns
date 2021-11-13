alter  session set nls_territory='Switzerland';
select to_char(date '2021-01-01','D') from dual;
--
-- 5

alter  session set nls_territory='America';
select to_char(date '2021-01-01','D') from dual;
--
-- 6
