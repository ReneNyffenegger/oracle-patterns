create sequence session_seq start with 1 increment by 1 
   /* Note the following keyword: */ SESSION;

select session_seq.nextval from dual;
select session_seq.nextval from dual;
select session_seq.nextval from dual;
select session_seq.nextval from dual;


connect &username/&password

select session_seq.nextval from dual;
select session_seq.nextval from dual;
select session_seq.nextval from dual;
select session_seq.nextval from dual;

drop sequence session_seq;

--
-- Note: a session level sequence can be changed to a global sequence and vice versa
-- alter sequence session_seq global;
-- alter sequence session_seq session;
