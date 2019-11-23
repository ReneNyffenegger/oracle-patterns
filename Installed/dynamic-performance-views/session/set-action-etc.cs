using System;
using System.Data.Common;
using Oracle.DataAccess.Client;
using System.Data;

class Prg {

   private static OracleConnection connectOracle(string user, string password, string dataSource) {
      return new OracleConnection($"user Id={user};password={password};data source={dataSource}");
   }

   static void Main() {

      OracleConnection ora = connectOracle("rene", "rene", "ORA18");
      ora.Open();

      OracleCommand sql = new OracleCommand(@"
        select
           sid,
           serial#,
           osuser,
           username,
           action,
           client_identifier,
           client_info,
           module
        from
           v$session
        where
        --
        -- development/databases/Oracle/installed/dynamic-performance-views/session/identify-own-session
        --
           sid = sys_context('userenv', 'sid')
        ");

      sql.Connection = ora;
   //
   // Values must be set before executing ExecuteReader()
   //
      ora.ActionName = "TQ84: action"     ;
      ora.ClientId   = "TQ84: client id"  ;
      ora.ClientInfo = "TQ84: client info";
      ora.ModuleName = "TQ84: module name";

      OracleDataReader resultSet = sql.ExecuteReader();
      while (resultSet.Read()) {
      //
      // One record/iteration expected only
      //
         for (int colNo=0; colNo<resultSet.FieldCount; colNo++) {

            string colVal;
            if (resultSet.IsDBNull(colNo)) {
               colVal = "<null>";
            }
            else {
               colVal = resultSet[colNo].ToString();
            }
            Console.WriteLine(String.Format("  {0,-20}: {1}",
               resultSet.GetName(colNo),
               colVal
            ));
         }
      }
   }
}
