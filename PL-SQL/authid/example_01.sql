accept db         prompt "TNS name: "
accept priv_user  prompt "User with enough rights to create schema: "
accept priv_pw    prompt "Password of that user: "

set verify off
connect &priv_user/&priv_pw@&db

create   user data 
identified by data$012
quota unlimited on users;


create   user reader 
identified by reader$012;


grant create table,
      create session,
      create public synonym,
      create view to data;

grant create procedure,
      create session to reader;


connect data/data$012@&db

create table some_data (
  nm   number,
  tx   varchar2(20)
);

insert into some_data values ( 1, 'one');
insert into some_data values ( 2, 'two');
insert into some_data values ( 3, 'three');
insert into some_data values ( 4, 'four');
insert into some_data values ( 5, 'five');
insert into some_data values ( 6, 'six');
insert into some_data values ( 7, 'seven');
insert into some_data values ( 8, 'eight');
insert into some_data values ( 9, 'nine');

create view some_data_view as
  select * from data.some_data
   where nm > 5;

grant select on some_data_view to reader with grant option;

create public synonym some_data for data.some_data_view;

connect reader/reader$012@&db

create package read as
  procedure data;
end read;
/

create package read_dynamic 
       AUTHID CURRENT_USER
as
  procedure data;
end read_dynamic;
/


create package body read as
  procedure data 
  is begin
    for r in (select * from some_data) loop
        dbms_output.put_line(r.nm || ': ' || r.tx);
    end loop;
  end data;
end read;
/

create package body read_dynamic as
  procedure data 
  is begin
    for r in (select * from some_data) loop
        dbms_output.put_line(r.nm || ': ' || r.tx);
    end loop;
  end data;
end read_dynamic;
/

grant execute on read         to data;
grant execute on read_dynamic to data;

prompt Schema read.

prompt
prompt read data:
prompt

exec read.data

prompt
prompt read dynamic data:
prompt

exec read_dynamic.data

connect data/data$012@&db

prompt Schema Data.
prompt
prompt read data:
prompt

exec reader.read.data

prompt
prompt read dynamic data:
prompt

exec reader.read_dynamic.data

connect &priv_user/&priv_pw@&db

drop user reader cascade;
drop user data   cascade;
drop public synonym some_data;
