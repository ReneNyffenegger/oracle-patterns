alter session set events '10046 trace name context forever, level 12';
alter session set events '10051 trace name context forever, level 1';
alter session set events '10053 trace name context forever';

--
-- Note, neither 10046 nor 10053 is reported...
--
declare
  lvl number;
begin

    for ev in 10000 .. 10999 loop
        sys.dbms_system.read_ev (ev, lvl);

        if lvl > 0 then
           dbms_output.put_line ('Event ' || ev || ' is set to level ' || lvl);
        end if;

    end loop;
end;
/
