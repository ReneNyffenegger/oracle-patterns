  add-type -path $env:ORACLE_HOME\odp.net\bin\4\Oracle.DataAccess.dll
# add-type -path C:\oracle\clients\122_32\odp.net\bin\4\Oracle.DataAccess.dll

$con = new-object Oracle.DataAccess.Client.OracleConnection 'Data Source=dreampt2;user id=...;password=...'

$con.Open()

$stmt = $con.CreateCommand()
$stmt.CommandText = @"
begin

   dbms_utility.expand_sql_text (
       input_sql_text  => :in ,
       output_sql_text => :out
   );

end;
"@

# StoredProcedure MUST NOT BE SET to execute anonymous procedures
#   $stmt.CommandType = [System.Data.CommandType]::StoredProcedure

$param_in   = $stmt.Parameters.Add(':in'  , [Oracle.DataAccess.Client.OracleDbType]::Clob, [System.Data.ParameterDirection]::Input )
$param_out  = $stmt.Parameters.Add(':out' , [Oracle.DataAccess.Client.OracleDbType]::Clob, [System.Data.ParameterDirection]::Output)

$param_in.Value  = @'
select
   *
from
   user_objects
where
   object_name like 'A%'
'@

$param_out.Value = [System.DBNull]

$stmt.ExecuteNonQuery()

write-host $param_out.Value.Value
