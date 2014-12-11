#
#   This script belongs to create_index_during_execution.plsql, go there
#   for a little more information.
#
use warnings;
use strict;

# https://github.com/ReneNyffenegger/OracleTool

use lib 'C:\github\OracleTool';
use OracleTool qw(connect_db);

my $connection_string = shift;

my $dbh = connect_db($connection_string);

# $dbh->do("declare s number; begin s:=sys.dbms_pipe.create_pipe('index_during_exec'); end;");

my $sth = $dbh -> prepare (qq{

  declare
    s integer;
  begin
    s := sys.dbms_pipe.receive_message('index_during_exec');

    if s = 0 then 
      dbms_pipe.unpack_message(:msg); 
    end if; 

  end;

});

my $msg = ' ' x 200;

$sth -> bind_param_inout(':msg', \$msg, 200, {TYPE=>DBI::SQL_VARCHAR});
$sth -> execute;

print "Msg recevied: $msg\n";

if ($msg eq 'create index now') {
  $dbh -> do ('create index tq84_1000000_ix on tq84_1000000(text)');
  print "Index built\n";
}

$dbh -> rollback;
