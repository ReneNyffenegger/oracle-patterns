create table rene.changed_passwords (
  usr  varchar2(30),
  pw   varchar2(30),
  pwo  varchar2(30)
);

connect sys/IamSysdba as sysdba

create function sys.tq84_pw_change (
  username     in varchar2,
  password     in varchar2,
  password_old in varchar2
) 
  return boolean
is
  
    procedure ins is
      pragma autonomous_transaction;
    begin

        insert into rene.changed_passwords values (
          username,
          password, 
          password_old
        );

        commit;

    end ins;

begin

    ins;

    return true;

end tq84_pw_change;
/

connect rene/rene

create profile tq84_pw_profile
       limit    password_verify_function tq84_pw_change;


create user test_user 
       identified by test_user
       profile tq84_pw_profile;

grant create session to test_user;

connect test_user/test_user

alter user test_user identified by new_pw replace test_user;

connect rene/rene

drop user test_user cascade;
drop profile  tq84_pw_profile;

select * from changed_passwords;

connect sys/IamSysdba as sysdba
drop function tq84_pw_change;
drop table rene.changed_passwords;

connect rene/rene

