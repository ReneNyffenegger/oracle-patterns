create sequence tq84_sequence
start   with 1
increment by 1
nocache
nocycle;

select tq84_sequence.nextval from dual;

select * from user_sequences where sequence_name = 'TQ84_SEQUENCE';

drop sequence tq84_sequence;
