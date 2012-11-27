use warnings;
use strict;

use DBI qw(:sql_types);
use DBD::Oracle;

init();

while (my $msg = read_pipe('TestPipe') ) {
  print "$msg\n";
}


my $g_dbh;
my $g_sth;
sub init {
    

   print "User: ";     my $user = <STDIN>;
   print "Password: "; my $pw   = <STDIN>;
   print "SID: ";      my $sid  = <STDIN>;

   chomp($user, $pw, $sid);

   $g_dbh = DBI->connect("dbi:Oracle:$sid", $user, $pw);

   $g_sth = $g_dbh -> prepare (q{
   declare
     s integer; 
   begin 

     s := sys.dbms_pipe.receive_message(:queue_name); 

     if s = 0 then 
       dbms_pipe.unpack_message(:item); 
     end if; 

   end;
   }) or die;

}

sub read_pipe {

  my $queue_name = shift;
  my $item = ' ' x 200;

  $g_sth -> bind_param      (':queue_name', $queue_name,      {TYPE=>SQL_VARCHAR});
  $g_sth -> bind_param_inout(':item'      ,\$item      , 200, {TYPE=>SQL_VARCHAR});

  $g_sth -> execute;

  return $item;

}
