create or replace type body tq84_listagg_t is

    static function ODCIAggregateInitialize(sctx in out nocopy tq84_listagg_t, separator varchar2)
        return number
    is
    begin
        sctx := tq84_listagg_t(separator, tq84_listagg_rec_t());

        return ODCIConst.success;
    end ODCIAggregateInitialize;


    member function ODCIAggregateIterate(
        self     in out nocopy tq84_listagg_t,
        rec      in            tq84_listagg_rec
    )
    return number is
    begin

        self.recs.extend;
        self.recs(self.recs.count) := rec;

        return ODCIConst.success;
    end ODCIAggregateIterate;


    member function ODCIAggregateTerminate(
        self         in  out nocopy tq84_listagg_t,
        return_value     out nocopy clob,
        flags        in             number
    )
    return number is
        first_ boolean := true;
    begin

        dbms_lob.createTemporary(return_value, true, dbms_lob.call);

        for x in (select value_ from table(self.recs) order by order_by) loop

           if first_ then
              first_ := false;
           else
              dbms_lob.writeAppend(return_value, length(self.sep), self.sep);
           end if;

           dbms_lob.writeAppend(return_value, length(x.value_), x.value_);

        end loop;

  --    TODO: who is responsible for freeing the clob
  --    dbms_lob.freeTemporary(return_value);

        return ODCIConst.success;
    end ODCIAggregateTerminate;


    member function ODCIAggregateMerge(
        self in out nocopy tq84_listagg_t,
        ctx2 in            tq84_listagg_t
    ) return number is
       aggregated clob;
    begin

raise_application_error(-20800, 'is the method ever called without parallel mode?');

/*

        if ctx2.aggregated is not null then
           dbms_lob.writeAppend(self.aggregated, length(sep) , sep        );
           dbms_lob.append     (self.aggregated, ctx2.aggregated);
        end if;
*/

        return ODCIConst.success;

    end ODCIAggregateMerge;

end;
/
