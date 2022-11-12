connect / as sysdba

@ create_schemas

@ create_table

host exp userid=rene/rene tables=(u1.tq84_table_for_export)

host imp userid=rene/rene fromuser=u1 touser=u2

drop user u1 cascade;

@select

drop user u2 cascade;
