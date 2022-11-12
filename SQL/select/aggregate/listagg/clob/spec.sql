create or replace type tq84_listagg_t as object (
 --
 -- Type to prevent ORA-01489 when using listagg.
 --

    aggregated clob,
    sep        varchar2(4000),
    first_     char(1),

    static function ODCIAggregateInitialize(sctx            in out tq84_listagg_t, separator varchar2)
                    return number,

    member function ODCIAggregateIterate   (self            in out tq84_listagg_t,
                                            value           in     varchar2      )
                    return number,

    member function ODCIAggregateTerminate (self            in out tq84_listagg_t,
                                            return_value       out clob          ,
                                            flags           in     number        )
                    return number,

    member function ODCIAggregateMerge(self in out tq84_listagg_t,
                                       ctx2 in     tq84_listagg_t    )
                    return number,

    static function go(value varchar2)
                    return clob
                    parallel_enable
                    aggregate using tq84_listagg_t


);
/
