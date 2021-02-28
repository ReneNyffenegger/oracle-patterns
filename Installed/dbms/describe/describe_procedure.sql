declare
    overload               sys.dbms_describe.number_table;
    pos                    sys.dbms_describe.number_table;
    lvl                    sys.dbms_describe.number_table;
    arg                    sys.dbms_describe.varchar2_table;
    dty                    sys.dbms_describe.number_table;
    def                    sys.dbms_describe.number_table;
    inout                  sys.dbms_describe.number_table;
    len                    sys.dbms_describe.number_table;
    prec                   sys.dbms_describe.number_table;
    scal                   sys.dbms_describe.number_table;
    rad                    sys.dbms_describe.number_table;
    spa                    sys.dbms_describe.number_table;
begin

    sys.dbms_describe.describe_procedure(
       'DBMS_DESCRIBE.DESCRIBE_PROCEDURE', null, null,
        overload,
        pos, lvl, arg, dty, def, inout, len, prec, scal, rad, spa
    );

    for p in 1 .. pos.count loop

        dbms_output.put_line(
        --  overload(p) || ': ' || lvl(p) || ', ' ||
            rpad(arg(p), 30)   ||
            rpad(
              case dty(p)
                when 1 then 'varchar2'
                else '? ' || dty(p)
              end, 30
            )  ||
            rpad(def  (p), 3) ||
            rpad(inout(p), 3) ||
            rpad(len  (p), 5) ||
            rpad(prec (p), 2) ||
            rpad(scal (p), 2) ||
            rpad(rad  (p), 2)
        );

    end loop;

end;
/
