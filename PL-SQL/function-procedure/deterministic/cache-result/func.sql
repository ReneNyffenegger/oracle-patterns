create or replace function tq84_double(i number) return number deterministic
is
    procedure write_log_entry
    is
        pragma autonomous_transaction;
    begin
        insert into tq84_call_log values (systimestamp, i);
        commit;
    end write_log_entry;
begin
    write_log_entry;
    return i*2;
end tq84_double;
/
