create or replace type body tq84_listagg_t is


    static function ODCIAggregateInitialize(sctx in out tq84_listagg_t, separator varchar2)
        return number
    is
    begin
        sctx := tq84_listagg_t(null, separator, 'y');

        dbms_lob.createTemporary(sctx.aggregated, true, dbms_lob.call);

        return ODCIConst.success;
    end ODCIAggregateInitialize;


    member function ODCIAggregateIterate(
        self  in out tq84_listagg_t,
        value in     varchar2
    )
    return number is
    begin

--      if value is null then
--         return ODCIConst.success;
--      end if;

        if self.first_  = 'y' then
           self.first_ := 'n';
        else
           dbms_lob.writeAppend(self.aggregated, length(sep), sep);
        end if;

        dbms_lob.writeAppend(self.aggregated, length(value), value);

        return ODCIConst.success;
    end ODCIAggregateIterate;


    member function ODCIAggregateTerminate(
        self         in  out tq84_listagg_t,
        return_value     out clob,
        flags        in      number
    )
    return number is
    begin
        return_value := self.aggregated;
        dbms_lob.freeTemporary(self.aggregated);
        return ODCIConst.success;
    end ODCIAggregateTerminate;


    member function ODCIAggregateMerge(
        self in out tq84_listagg_t,
        ctx2 in     tq84_listagg_t
    ) return number is
    begin

        if ctx2.aggregated is not null then
           dbms_lob.writeAppend(self.aggregated, length(sep) , sep        );
           dbms_lob.append     (self.aggregated, ctx2.aggregated);
        end if;

        return ODCIConst.success;

    end ODCIAggregateMerge;

end;
/
