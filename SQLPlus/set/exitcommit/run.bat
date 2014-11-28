sqlplus -S %connection% @exit_commit_off
sqlplus -S %connection% @select

sqlplus -S %connection% @exit_commit_on
sqlplus -S %connection% @select
