whenever sqlerror exit

select q'[This statement is executed]'       txt from dual;

select 1 from "no such table";

select q'[This statement won't be executed]' txt from dual;
