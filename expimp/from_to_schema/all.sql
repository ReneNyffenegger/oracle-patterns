start create_schemas

start create_table

host exp userid=rene tables=(u1.tq84_table_for_export)

host imp userid=rene fromuser=u1 touser=u2

drop user u1 cascade;

connect rene

select * from u2.tq84_table_for_export;

drop user u2 cascade;
