create or replace view sqlcommand_verb_noun as
select
                       lower(command_name)                     sql_statement,
         regexp_substr(lower(command_name),   '[^ ]+' , 1, 1 ) verb,
   ltrim(regexp_substr(lower(command_name), ' ([^ ])+', 1, 1)) ||
         regexp_substr(lower(command_name), ' ([^ ])+', 1, 2)  noun
from
   v$sqlcommand
where
   command_name is not null and
   command_name    not like 'Do not use%' and
   command_name    not in ('NO-OP', 'PL/SQL EXECUTE')
;

select
   substrb(sql_statement, 1, 28) sql_statement,
   substrb(verb         , 1, 12) verb,
   substrb(noun         , 1, 20) noun
from
   sqlcommand_verb_noun fetch first 5 rows only;
--
-- SQL_STATEMENT                VERB         NOUN                
-- ---------------------------- ------------ --------------------
-- create table                 create       table               
-- insert                       insert                           
-- select                       select                           
-- create cluster               create       cluster             
-- alter cluster                alter        cluster   
