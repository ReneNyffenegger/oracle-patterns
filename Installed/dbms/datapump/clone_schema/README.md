An example that demonstrate how a schema is cloned within a database with `dbms_datapump`.

[`run.sql`](https://github.com/ReneNyffenegger/oracle-patterns/blob/master/Installed/dbms/datapump/clone_schema/run.sql) is the driving script.

In order to do the exports with PL/SQL and `dbms_datapump`, use the script
[`export_import_plsql.sql`](https://github.com/ReneNyffenegger/oracle-patterns/blob/master/Installed/dbms/datapump/clone_schema/export_import_plsql.sql). Alternatively, the export/import can also be done on the command line with
[`export_import_dp.sql`](https://github.com/ReneNyffenegger/oracle-patterns/blob/master/Installed/dbms/datapump/clone_schema/export_import_dp.sql).
The according lines can be commented in `run.sql`.

When the PL/SQL variant is used, the PL/SQL functionality is called in
[`export.plsql`](https://github.com/ReneNyffenegger/oracle-patterns/blob/master/Installed/dbms/datapump/clone_schema/export.plsql) and
[`import.plsql`](https://github.com/ReneNyffenegger/oracle-patterns/blob/master/Installed/dbms/datapump/clone_schema/import.plsql), respectively.

When the command line variant is used, these parameter files are used:
[`export.par`](https://github.com/ReneNyffenegger/oracle-patterns/blob/master/Installed/dbms/datapump/clone_schema/export.par) and
[`import.par`](https://github.com/ReneNyffenegger/oracle-patterns/blob/master/Installed/dbms/datapump/clone_schema/import.par), respectively.

## Links

See also [this blog post](http://renenyffenegger.blogspot.ch/2015/02/cloning-oracle-schema-with-dbmsdatapump.html).
