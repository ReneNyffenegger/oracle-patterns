create or replace type tq84_text_range_t as object (

    min_val varchar2(4000),
    max_val varchar2(4000),

    static function ODCIAggregateInitialize(sctx  in out tq84_text_range_t) 
                    return number,

    member function ODCIAggregateIterate   (self  in out tq84_text_range_t, 
                                            value in varchar2 ) 
                    return number,

    member function ODCIAggregateTerminate (self         in     tq84_text_range_t   , 
                                            return_value    out varchar2, 
                                            flags        in number      )               
                    return number,

    member function ODCIAggregateMerge(self in out tq84_text_range_t, 
                                       ctx2 in tq84_text_range_t    ) 
                    return number
);
/
