begin

  for open_db_link in (
    select
      db_link,
      in_transaction
    from
      v$dblink
  ) loop

    if open_db_link.in_transaction <> 'NO' then
       dbms_output.put_line('Cannot close db link ' || open_db_link.db_link || ' as it is in a transaction.');
    else

       execute immediate 'alter session close database link ' || open_db_link.db_link;
       dbms_output.put_line('db link ' || open_db_link.db_link || ' was closed.');

    end if;

  end loop;

end;
/
