create type tq84_listagg_rec authid definer as object (
     value_   varchar2(4000),
     order_by integer
);
/

create type tq84_listagg_rec_t as table of tq84_listagg_rec;
/

create or replace type tq84_listagg_t authid definer as object (

    sep        varchar2(4000),
    recs       tq84_listagg_rec_t,

    static function ODCIAggregateInitialize(sctx            in out nocopy tq84_listagg_t,
                                            separator                     varchar2      )
                    return number,

    member function ODCIAggregateIterate   (self            in out nocopy tq84_listagg_t,
                                            rec             in            tq84_listagg_rec
                                       --   value_          in            varchar2      ,
                                       --   order_by        in            integer       
                                            )
                    return number,

    member function ODCIAggregateTerminate (self            in out nocopy tq84_listagg_t,
                                            return_value       out nocopy clob          ,
                                            flags           in            number        )
                    return number,

    member function ODCIAggregateMerge     (self            in out nocopy tq84_listagg_t,
                                            ctx2            in            tq84_listagg_t)
                    return number,

    static function go(rec tq84_listagg_rec, order_by number)
                    return clob
    --              parallel_enable
                    aggregate using tq84_listagg_t


);
/
